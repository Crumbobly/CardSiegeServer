from random import random

from services.game_service.card.card import Card
from services.game_service.field import Field
from services.game_service.hand import Hand
from services.game_service.library import Library
from services.game_service.resources import Resources
import random


class Game:
    chat: list[tuple[str, str]] = []

    def __init__(self, p1_id: str, p2_id: str, p1_l: str, p2_l: str, lib1: Library, lib2: Library):
        self.hp1: int = 20
        self.hp2: int = 20
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

    def delete_this_function(self):
        c1 = [Card(str(i) + "blue") for i in range(1, 45)]
        c2 = [Card(str(i) + "red") for i in range(1, 45)]

        h1 = random.sample(c1, 6)
        h2 = random.sample(c2, 6)
        c1 = [card for card in c1 if card not in h1]
        c2 = [card for card in c2 if card not in h2]

        self.hand1.cards = h1
        self.hand2.cards = h2
        self.library1.cards = c1
        self.library2.cards = c2
        self.chat = [("hi", "bye")]

    def to_dict(self, id):
        return {
            "chat": self.chat,
            "player1_id": self.player1_id,
            "player2_id": self.player2_id,
            "player1_login": self.player1_login,
            "player2_login": self.player2_login,
            "hp1": self.hp1,
            "hp2": self.hp2,
            "library1_size": len(self.library1.cards),
            "library2_size": len(self.library2.cards),
            "field": self.field.to_dict(),
            "hand1": self.hand1.to_dict() if id == self.player1_id else None,
            "hand2": self.hand2.to_dict() if id == self.player2_id else None,
            "hand1_size": len(self.hand1.cards),
            "hand2_size": len(self.hand2.cards),
            "resources1": self.resources1.to_dict(),
            "resources2": self.resources2.to_dict(),
        }
