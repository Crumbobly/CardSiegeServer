from dataclasses import dataclass
from typing import Any


@dataclass
class Request:
    scene_class_name: str
    func_name: str
    args: list[Any]  # must be serializable

    def to_dict(self):

        return {
            "scene_class_name": self.scene_class_name,
            "func_name": self.func_name,
            "args": self.args
        }

    @staticmethod
    def from_dict(data: dict):
        return Request(
            scene_class_name=data["scene_class_name"],
            func_name=data["func_name"],
            args=data["args"]
        )
