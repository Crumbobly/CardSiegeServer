from services.game_service.game import Game
from services.game_service.library import Library


class GameList:

    def __init__(self, auth_manager):
        self.auth_manager = auth_manager
        self.game_list: list[Game] = []

    def create_and_get_game(self, p1_id, p2_id) -> Game:
        p1_login = self.auth_manager.get_login(p1_id)
        p2_login = self.auth_manager.get_login(p2_id)
        lib1 = Library()
        lib2 = Library()

        game = Game(p1_id, p2_id, p1_login, p2_login, lib1, lib2)
        self.game_list.append(game)
        return game
