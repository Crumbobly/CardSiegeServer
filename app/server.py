import json
import logging
import uuid

import websockets
from dependency_injector.wiring import inject, Provide
from websockets.asyncio.server import ServerConnection

from app.containers import Container
from app.request_handler import RequestHandler, AuthError
from utils.dto import Request
from services.sender import Sender

log = logging.getLogger()


class Server:

    def __init__(self, host, port):
        self.host = host
        self.port = port

    @inject
    async def handle_connection(self, websocket: ServerConnection,
                                request_handler: RequestHandler = Provide[Container.request_handler],
                                sender: Sender = Provide[Container.sender]):
        user_id = str(uuid.uuid4())
        sender.sub_user(user_id, websocket)
        log.info(f"Пользователь {user_id} подключился.")
        try:
            while True:
                message = await websocket.recv()
                data = json.loads(message)
                scene_class_name = data.get("scene_class_name")
                func_name = data.get("func_name")
                args = data.get("args", [])
                request = Request(scene_class_name, func_name, args)

                log.info(f"Запрос получен: {request} от {user_id}")
                try:
                    await request_handler.handle_request(request, user_id=user_id)
                except (ValueError, AttributeError, AuthError) as e:
                    log.warning(f"Запрос отклонён: {request} от {user_id}. {e!r}")
                except Exception as e:
                    log.exception(f"Exception from handler: {e!r}")

        except websockets.ConnectionClosed as e:
            log.info("Соединение закрыто:", e)

    async def start(self):
        async with websockets.serve(self.handle_connection, self.host, self.port) as serve:
            log.info(f"Сервер запущен на ws://{self.host}:{self.port}")
            await serve.wait_closed()
