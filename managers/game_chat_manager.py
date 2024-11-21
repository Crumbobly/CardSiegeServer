from utils.request import Request
from utils.request_handler import RequestHandler


class GameChatManager:

    def __init__(self, server):
        self.server = server
        RequestHandler().register("GameChat", self)

    async def write_in_chat(self, p2_id, msg, user_id: str):
        nickname = self.server.auth_manager.get_login(user_id)
        request1 = Request("GameChat", "add_message", [nickname, msg])
        request2 = Request("GameChat", "add_message", [nickname, msg])

        await self.server.send_request(user_id, request1)
        await self.server.send_request(p2_id, request2)

