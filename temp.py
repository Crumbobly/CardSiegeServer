import asyncio
import json

import websockets

async def test(login):
    async with websockets.connect('ws://0.0.0.0:12345') as conn:
        while True:
            await conn.send(json.dumps(dict(scene_class_name="Auth",
                                            func_name="login", #login
                                            args=[login, '123'])))
            message = await conn.recv()
            print(message)
            await conn.send(json.dumps(dict(scene_class_name="Lobby",
                                            func_name="add_queue",
                                            args=[])))
            message = await conn.recv()
            print(message)
            await conn.recv()

async def main():
    await asyncio.gather(test('login123'), test('ahahaha'))
if __name__ == '__main__':
    asyncio.run(main())
