import asyncio
import logging
import logging.config
from pathlib import Path

from app.containers import Container, load_config_from_env
from app.server import Server


def create_server():
    container = Container()
    load_config_from_env(container)
    container.wire(modules=[__name__])
    logging_config_path = container.config.logging_config_path()
    if Path(logging_config_path).is_file():
        logging.config.fileConfig(logging_config_path)
    return Server("0.0.0.0", 12345)


def main():
    asyncio.run(create_server().start())


if __name__ == "__main__":
    main()
