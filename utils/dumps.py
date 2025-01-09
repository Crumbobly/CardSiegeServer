import functools
import json

from utils.dto import Request


def help_serialize_json(obj):
    if isinstance(obj, Request):
        return obj.to_dict()
    else:
        return json.dumps(obj)


json_dumps = functools.partial(json.dumps, default=help_serialize_json)
