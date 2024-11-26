import asyncio
import json
import time
import uuid
import websockets

from database.database import DataBase
from managers.auth_manager import AuthManager
from managers.game_chat_manager import GameChatManager
from utils.game_list import GameList
from managers.lobby_manager import LobbyManager
from utils.request import Request
from utils.request_handler import RequestHandler
from config.config import db_host, db_name, db_port, db_user, db_password


class Server:

    def __init__(self):
        self.connected_users = {}

        self.database = DataBase(db_name, db_user, db_password, db_host, db_port)

        RequestHandler().register("Server", self)

        self.auth_manager: AuthManager = AuthManager(self)
        self.lobby_manager: LobbyManager = LobbyManager(self)
        self.game_chat_manager: GameChatManager = GameChatManager(self)
        self.game_list: GameList = GameList(self)

    async def handle_connection(self, websocket):

        user_id = str(uuid.uuid4())
        self.connected_users[user_id] = websocket
        print(f"Пользователь {user_id} подключился.")

        try:
            async for message in websocket:
                data = json.loads(message)
                scene_class_name = data.get("scene_class_name")
                func_name = data.get("func_name")
                args = data.get("args", [])

                request = Request(scene_class_name, func_name, args)

                if scene_class_name == "Auth" or self.auth_manager.is_auth(user_id):
                    print(f"Запрос получен: {request} от {user_id}")
                    await RequestHandler().handle_request(request, user_id=user_id)
                else:
                    print(f"Запрос отклонён: {request} от {user_id}")

        except websockets.ConnectionClosed as e:
            if user_id in self.lobby_manager.waiting_set:
                self.lobby_manager.remove_queue(user_id)
            if user_id in self.auth_manager.auth_users.keys():
                self.auth_manager.remove_auth(user_id)
            self.connected_users.pop(user_id)
            print("Соединение закрыто:", e)

    async def send_request(self, user_id, request):
        websocket = self.connected_users[user_id]
        request_json = json.dumps(request.to_dict())
        await websocket.send(request_json)

    async def ping(self, class_callback, func_callback, client_time, user_id):
        client_server_time = time.time()
        request = Request(class_callback, func_callback, [client_server_time])
        await self.send_request(user_id, request)

    async def start(self):
        async with websockets.serve(self.handle_connection, "0.0.0.0", 12345):
            print("Сервер запущен на ws://0.0.0.0:12345")
            await asyncio.Future()


if __name__ == "__main__":
    asyncio.run(Server().start())
