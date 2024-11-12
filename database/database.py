from typing import Optional

import psycopg2
from psycopg2 import sql


class DataBase:

    def __init__(self, db_name: str, user: str, password: str, host: str, port: int = 5432):
        self.connection = psycopg2.connect(
            dbname=db_name,
            user=user,
            password=password,
            host=host,
            port=port
        )
        self.connection.autocommit = True
        self.cursor = self.connection.cursor()
        print("База данных подключена")

    # Получение всех колод игрока (+ парсинг)
    # Получение текущей колод игрока (+ парсинг)
    # Получение списка карт в колоде (как объектов класса Card)

    def create_user(self, login: str, password: str) -> bool:
        try:
            query = sql.SQL("INSERT INTO auth.user_accounts (login, password) VALUES (%s, %s)")
            self.cursor.execute(query, (login, password))
            print(f"Пользователь {login} успешно создан.")
            return True
        except psycopg2.Error as e:
            print(f"Ошибка создания пользователя: {e}")
            return False

    def get_user_by_login(self, login: str) -> Optional[dict]:
        try:
            query = sql.SQL("SELECT login, password FROM auth.user_accounts WHERE login = %s")
            self.cursor.execute(query, (login,))
            result = self.cursor.fetchone()
            if result:
                return {"login": result[0], "password": result[1]}
            else:
                return None

        except psycopg2.Error as e:
            print(f"Ошибка получение пользователя: {e}")
            return None

    def close(self):
        self.cursor.close()
        self.connection.close()
        print("База данных отключена.")
