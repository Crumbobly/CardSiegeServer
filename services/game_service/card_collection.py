from services.game_service.card.card import Card


class CardCollection:

    def __init__(self):
        self.cards: list[Card] = []

    def to_dict(self):
        return [card.to_dict() for card in self.cards]
