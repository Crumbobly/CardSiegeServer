from utils.request import Request


class Singleton(type):
    _instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super(Singleton, cls).__call__(*args, **kwargs)
        return cls._instances[cls]


# Просили чтобы был Синглтон, вот он.
class RequestHandler(metaclass=Singleton):

    def __init__(self):
        self.__references = {}

    def register(self, class_name: str, obj: object):
        self.__references[class_name] = obj

    async def handle_request(self, request: Request, user_id):
        class_name = request.scene_class_name
        function_name = request.func_name
        args = request.args

        if class_name in self.__references:
            obj = self.__references[class_name]
            if hasattr(obj, function_name):
                method = getattr(obj, function_name)
                await method(*args, user_id=user_id)
            else:
                raise AttributeError(f"Метод {function_name} не найден в классе {class_name}")
        else:
            raise ValueError(f"Класс {class_name} не зарегистрирован")
