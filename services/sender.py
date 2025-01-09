import json

from websockets.asyncio.server import ServerConnection


class Sender:
    def __init__(self, json_dumps=json.dumps):
        self._user_sockets: dict[str, ServerConnection] = {}
        self.json_dumps = json_dumps

    async def send_request(self, user_id: str, message):
        if user_id in self._user_sockets:
            request_json = self.json_dumps(message)
            await self._user_sockets[user_id].send(request_json)
            return True
        return False

    def _unsub_callback(self, user_id: str):
        def callback(context):
            self._user_sockets.pop(user_id)

        return callback

    def is_alive(self, user_id: str):
        return user_id in self._user_sockets

    def sub_user(self, user_id: str, websocket: ServerConnection):
        self._user_sockets[user_id] = websocket
        self.add_close_callback(user_id, self._unsub_callback(user_id))

    def add_close_callback(self, user_id: str, callback):
        websocket = self._user_sockets[user_id]
        websocket.connection_lost_waiter.add_done_callback(callback)
