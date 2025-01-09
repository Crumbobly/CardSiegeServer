from app.handlers.auth_handler import AuthHandler
from utils.dto import Request

from utils.permisson import is_need_auth


class AuthError(Exception):
    pass


class RequestHandler:

    def __init__(self, auth_manager: AuthHandler, **kwargs):
        self.__references = kwargs
        self._auth_manager = auth_manager

    async def handle_request(self, request: Request, user_id: str):
        class_name = request.scene_class_name
        method_name = request.func_name
        args = request.args

        if class_name in self.__references:
            obj = self.__references[class_name]
            if hasattr(obj, method_name):
                method = getattr(obj, method_name)
                if is_need_auth(method):
                    if not self._auth_manager.is_auth(user_id):
                        raise AuthError(f"Для {method_name=} в {class_name=} нужна авторизация")
                await method(*args, user_id=user_id)
            else:
                raise AttributeError(f"{method_name=} не найден в {class_name=}")
        else:
            raise ValueError(f"{class_name=} не зарегистрирован")
