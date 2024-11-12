from domain.field import Field
from domain.hand import Hand
from domain.library import Library
from domain.resources import Resources


class Game:

    chat: list[tuple[str, str]] = []
    hp1: int = 20
    hp2: int = 20

    def __init__(self, p1_id: str, p2_id: str, p1_l: str, p2_l: str, lib1: Library, lib2: Library):
        self.player1_id = p1_id
        self.player2_id = p2_id
        self.player1_login = p1_l
        self.player2_login = p2_l
        self.library1 = lib1
        self.library2 = lib2
        self.field = Field()
        self.hand1 = Hand()
        self.hand2 = Hand()
        self.resources1 = Resources()
        self.resources2 = Resources()

    def to_dict(self):
        return {
            "chat": self.chat,
            "player1_id": self.player1_id,
            "player2_id": self.player2_id,
            "player1_login": self.player1_login,
            "player2_login": self.player2_login,
            "hp1": self.hp1,
            "hp2": self.hp2,
            "library1": self.library1.to_dict(),
            "library2": self.library2.to_dict(),
            "field": self.field.to_dict(),
            "hand1": self.hand1.to_dict(),
            "hand2": self.hand2.to_dict(),
            "resources1": self.resources1.to_dict(),
            "resources2": self.resources2.to_dict(),
        }

    # @classmethod
    # def from_dict(cls, data) -> 'Game':
    #     """Create Game object from dictionary."""
    #     obj = cls(
    #         p1_id=data["player1_id"],
    #         p2_id=data["player2_id"],
    #         p1_l=data["player1_login"],
    #         p2_l=data["player2_login"],
    #         lib1=Library.from_dict(data["library1"]),
    #         lib2=Library.from_dict(data["library2"])
    #     )
    #     obj.chat = data["chat"]
    #     obj.hp1 = data["hp1"]
    #     obj.hp2 = data["hp2"]
    #     obj.field = Field.from_dict(data["field"])
    #     obj.hand1 = Hand.from_dict(data["hand1"])
    #     obj.hand2 = Hand.from_dict(data["hand2"])
    #     obj.resources1 = Resources.from_dict(data["resources1"])
    #     obj.resources2 = Resources.from_dict(data["resources2"])
    #     return obj
    #
