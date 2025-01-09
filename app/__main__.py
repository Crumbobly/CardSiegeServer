import asyncio
import logging
import logging.config
from pathlib import Path

import uvloop

from app.containers import Container, load_config_from_env
from app.server import Server

from aiomisc_log import basic_config, LogFormat


log = logging.getLogger()
def create_server(host="0.0.0.0", port=12345,
                  log_level=logging.DEBUG, log_format=LogFormat.default()):
    container = Container()
    load_config_from_env(container)
    container.wire(modules=[__name__])
    basic_config(log_level,
                 log_format,
                 buffered=True)
    logging_config_path = container.config.logging_config_path()
    if Path(logging_config_path).is_file():
        logging.config.fileConfig(logging_config_path)
    return Server(host, port)


def main():
    asyncio.set_event_loop_policy(uvloop.EventLoopPolicy())
    asyncio.run(create_server().start())


if __name__ == "__main__":
    main()
