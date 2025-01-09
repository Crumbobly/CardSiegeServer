import logging
from typing import AsyncIterable

import sqlalchemy as sa
from sqlalchemy.ext.asyncio import create_async_engine, AsyncConnection

log = logging.getLogger()


async def setup_pg(pg_dsn: str, pg_pool_size: int = 10) -> AsyncIterable[AsyncConnection]:
    log.info({
        "message": f'Connecting to database: {pg_dsn}'
    })

    pool = create_async_engine(str(pg_dsn), echo=False, pool_size=pg_pool_size)
    async with pool.connect() as conn:
        await conn.execute(sa.select(1))

    log.info({
        "message": f'Connected to database: {pg_dsn}'
    })

    try:
        async with pool.connect() as conn:
            yield conn
    finally:
        log.info({
            "message": f'Disconnecting to database: {pg_dsn}'
        })
        await pool.dispose()
        log.info({
            "message": f'Disconnected to database: {pg_dsn}'
        })
