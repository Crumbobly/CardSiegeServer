from functools import wraps

__auth_attrname = '__auth__'


def auth(_need_auth: bool | type[callable]):
    def wrapper(obj):
        def _wrapper():
            need_auth = _need_auth
            attrname = __auth_attrname
            if isinstance(obj, type):  # is class
                for name, method in filter(lambda item: not item[0].startswith('_'), obj.__dict__.items()):
                    setattr(method, attrname, getattr(method, attrname, need_auth))
            elif callable(obj):  # is func
                setattr(obj, attrname, need_auth)
            return obj

        return wraps(obj)(_wrapper)() if hasattr(obj.__dict__, 'update') else _wrapper()

    if not isinstance(_need_auth, bool):
        _obj, _need_auth = _need_auth, True
        return wrapper(_obj)
    return wrapper


def is_need_auth(obj):
    return getattr(obj, __auth_attrname, False)
