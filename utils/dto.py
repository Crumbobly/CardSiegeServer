from dataclasses import dataclass, fields, asdict
from typing import Any


@dataclass
class Request:
    scene_class_name: str
    func_name: str
    args: list[Any]  # must be serializable

    def to_dict(self):
        return asdict(self)

    @classmethod
    def from_dict(cls, data: dict):
        try:
            return Request(**{key.name: data[key.name] for key in fields(cls)})
        except KeyError as e:
            raise ValueError('Field not found') from e
        # return Request(
        #     scene_class_name=data["scene_class_name"],
        #     func_name=data["func_name"],
        #     args=data["args"]
        # )
