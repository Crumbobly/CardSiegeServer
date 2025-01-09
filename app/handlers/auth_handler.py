from passlib.handlers.bcrypt import bcrypt

from utils.dto import Request
from services.sender import Sender
from utils.permisson import auth


class AuthHandler:

    def __init__(self, db, sender: Sender):
        self.db = db
        self.sender = sender
        self.auth_users = {}  # id: login

    def remove_auth(self, user_id: str):
        self.auth_users.pop(user_id)

    def is_auth(self, user_id: str):
        return user_id in self.auth_users.keys()

    @auth
    def get_login(self, user_id: str):
        return self.auth_users[user_id]

    async def login(self, login: str, password: str, user_id: str):
        error_msg = "Неверный логин или пароль"
        user = await self.db.get_user_by_login(login)

        if user and bcrypt.verify(password, user["password"]):
            if login in self.auth_users.values():
                error_msg = "Вход в аккаунт уже был произведён"

            else:
                self.auth_users[user_id] = login
                request = Request("Auth", "server_here", [login])
                await self.sender.send_request(user_id, request)
                return

        request = Request("Auth", "set_error_lbl_text", [error_msg])
        await self.sender.send_request(user_id, request)

    async def register(self, login: str, password: str, user_id: str):
        error_msg = "Логин занят"
        check_user = await self.db.get_user_by_login(login)

        if check_user:
            request = Request("Auth", "set_error_lbl_text", [error_msg])
            await self.sender.send_request(user_id, request)
            return
        hash_pass = bcrypt.hash(secret=password)
        await self.db.create_user(login, hash_pass)
        self.auth_users[user_id] = login
        request = Request("Auth", "server_here", [login])
        await self.sender.send_request(user_id, request)
        return
