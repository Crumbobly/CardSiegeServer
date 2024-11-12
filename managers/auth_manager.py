from utils.request import Request
from utils.request_handler import RequestHandler


class AuthManager:

    def __init__(self, server):
        self.server = server
        self.auth_users = {}  # id: login
        RequestHandler().register("Auth", self)

    def remove_auth(self, user_id):
        self.auth_users.pop(user_id)

    def is_auth(self, user_id):
        return user_id in self.auth_users.keys()

    def get_login(self, user_id: str):
        return self.auth_users[user_id]

    async def login(self, login: str, password: str, user_id: str):

        error_msg = "Неверный логин или пароль"
        user = self.server.database.get_user_by_login(login)

        if user and user["password"] == password:

            if login in self.auth_users.values():
                error_msg = "Вход в аккаунт уже был произведён"

            else:
                self.auth_users[user_id] = login
                request = Request("Auth", "server_here", [login])
                await self.server.send_request(user_id, request)
                return

        request = Request("Auth", "set_error_lbl_text", [error_msg])
        await self.server.send_request(user_id, request)

    async def register(self, login: str, password: str, user_id: str):

        error_msg = "Логин занят"
        check_user = self.server.database.get_user_by_login(login)

        if not check_user:
            self.server.database.create_user(login, password)
            request = Request("Auth", "server_here", [login])
            await self.server.send_request(user_id, request)
            self.auth_users[user_id] = login
            return

        request = Request("Auth", "set_error_lbl_text", [error_msg])
        await self.server.send_request(user_id, request)
