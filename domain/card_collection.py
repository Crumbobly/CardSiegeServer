from domain.card.card import Card


class CardCollection:

    def __init__(self):
        self.cards: list[Card] = []

    def to_dict(self):
        return {"cards": [card.to_dict() for card in self.cards]}
