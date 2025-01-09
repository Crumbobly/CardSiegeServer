from dependency_injector import containers, providers
from sqlalchemy.ext.asyncio import AsyncConnection

from app.handlers.auth_handler import AuthHandler
from app.handlers.game_chat_handler import GameChatHandler
from app.handlers.lobby_handler import LobbyHandler
from app.request_handler import RequestHandler
from db.db_manager import DBManager
from services.game_service.game_list import GameList
from services.sender import Sender
from utils.dumps import json_dumps
from utils.pg import setup_pg


class Container(containers.DeclarativeContainer):
    config = providers.Configuration(strict=True)

    conn: AsyncConnection = providers.Resource(
        setup_pg,
        pg_dsn=config.postgres_dsn,
        pg_pool_size=config.postgres_pool_size
    )

    db_manager = providers.Singleton(
        DBManager,
        conn=conn
    )
    sender = providers.Singleton(
        Sender,
        json_dumps=json_dumps
    )
    auth_manager = providers.Singleton(
        AuthHandler,
        db=db_manager,
        sender=sender
    )

    game_list = providers.Singleton(
        GameList,
        auth_manager=auth_manager
    )
    lobby_manager = providers.Singleton(
        LobbyHandler,
        sender=sender,
        game_list=game_list
    )

    game_chat_manager = providers.Singleton(
        GameChatHandler,
        sender=sender,
        auth_manager=auth_manager
    )
    request_handler = providers.Singleton(
        RequestHandler,
        auth_manager=auth_manager,
        Auth=auth_manager,
        Lobby=lobby_manager,
        GameChat=game_chat_manager
    )


def load_config_from_env(container: Container) -> None:
    # app config
    container.config.env.from_env('ENV', as_=str, default='production', required=True)
    container.config.logging_config_path.from_env('LOGGING_CONFIG_PATH', as_=str, default='/app/logging.ini')
    container.config.python_asyncio_debug.from_env('PYTHONASYNCIODEBUG', as_=int, default=0)

    # redis/postgres
    container.config.postgres_dsn.from_env('DEFAULT_PG_URL',
                                           as_=str,
                                           default='postgresql+asyncpg://postgres:postgres@172.17.0.1:5432/gwintdb',
                                           required=True)
    container.config.postgres_pool_size.from_env('PG_POOL_SIZE', as_=int, default=10, required=True)
