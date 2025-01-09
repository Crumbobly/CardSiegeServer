import asyncio

from app.handlers.auth_handler import AuthHandler
from utils.dto import Request
from services.sender import Sender
from utils.permisson import auth


@auth
class GameChatHandler:

    def __init__(self, sender: Sender, auth_manager: AuthHandler):
        self.sender = sender
        self.auth_manager = auth_manager

    async def write_in_chat(self, p2_id, msg, user_id: str):
        nickname = self.auth_manager.get_login(user_id)
        request = Request("GameChat", "add_message", [nickname, msg])

        await asyncio.gather(self.sender.send_request(user_id, request),
                             self.sender.send_request(p2_id, request))
