from typing import Optional

import sqlalchemy as sa
from sqlalchemy.ext.asyncio import AsyncConnection


class DBManager:

    def __init__(self, conn: AsyncConnection):
        self.conn = conn

    # Получение всех колод игрока (+ парсинг)
    # Получение текущей колод игрока (+ парсинг)
    # Получение списка карт в колоде (как объектов класса Card)

    async def create_user(self, login: str, password: str) -> bool:
        query = sa.text("INSERT INTO auth.user_accounts (login, password) VALUES (:login, :password)")
        query_with_bindings = query.bindparams(login=login, password=password)
        await self.conn.execute(query_with_bindings)
        await self.conn.commit()
        return True

    async def get_user_by_login(self, login: str) -> Optional[dict]:
        query = sa.text("SELECT login, password FROM auth.user_accounts WHERE login = :login")
        query_with_bindings = query.bindparams(login=login)
        row = await self.conn.execute(query_with_bindings)
        result = row.first()
        return {"login": result[0], "password": result[1]} if result else None
