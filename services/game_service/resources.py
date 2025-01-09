class Resources:

    def __init__(self):
        self.money: int = 0
        self.material: int = 0
        self.mana: int = 0

    def to_dict(self):
        return {
            "money": self.money,
            "material": self.material,
            "mana": self.mana,
        }
