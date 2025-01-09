import asyncio

from utils.dto import Request
from services.game_service.game_list import GameList
from services.sender import Sender
from utils.permisson import auth


@auth
class LobbyHandler:

    def __init__(self, sender: Sender, game_list: GameList):
        self.sender = sender
        self.game_list = game_list
        self.waiting_set = set()  # ids

    def remove_queue(self, user_id):
        self.waiting_set.remove(user_id)

    async def add_queue(self, user_id):
        self.waiting_set.add(user_id)
        await self.__create_room()

    async def __create_room(self):
        if len(self.waiting_set) < 2:
            return

        player1 = self.waiting_set.pop()
        player2 = self.waiting_set.pop()

        game = self.game_list.create_and_get_game(player1, player2)
        #
        game.delete_this_function()
        #
        request1 = Request("Lobby", "start_online_game", [player1, game.to_dict(player1)])
        request2 = Request("Lobby", "start_online_game", [player2, game.to_dict(player2)])
        await asyncio.gather(self.sender.send_request(player1, request1),
                             self.sender.send_request(player2, request2))
