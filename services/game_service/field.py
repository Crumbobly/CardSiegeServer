from services.game_service.card_collection import CardCollection


class Field(CardCollection):

    row1_near = CardCollection()
    row1_middle = CardCollection()
    row1_long = CardCollection()
    row2_near = CardCollection()
    row2_middle = CardCollection()
    row2_long = CardCollection()

    def __init__(self):
        super().__init__()

    def to_dict(self):
        return {
            "row1_near": self.row1_near.to_dict(),
            "row1_middle": self.row1_middle.to_dict(),
            "row1_long": self.row1_long.to_dict(),
            "row2_near": self.row2_near.to_dict(),
            "row2_middle": self.row2_middle.to_dict(),
            "row2_long": self.row2_long.to_dict()
        }