from utils.request import Request
from utils.request_handler import RequestHandler


class LobbyManager:

    def __init__(self, server):
        self.server = server
        self.waiting_set = set()  # ids
        RequestHandler().register("Lobby", self)

    def remove_queue(self, user_id):
        self.waiting_set.remove(user_id)

    async def add_queue(self, user_id):
        self.waiting_set.add(user_id)
        await self.create_room()

    async def create_room(self):
        if len(self.waiting_set) < 2:
            return

        player1 = self.waiting_set.pop()
        player2 = self.waiting_set.pop()

        game = self.server.game_manager.create_and_get_game(player1, player2)

        request1 = Request("Lobby", "start_online_game", [game])
        request2 = Request("Lobby", "start_online_game", [game])
        await self.server.send_request(player1, request1)
        await self.server.send_request(player2, request2)

