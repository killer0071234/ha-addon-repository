#!/usr/bin/python
import asyncio
import logging
import sys
from configparser import ConfigParser

from config.config.config import Config
from config.config.config_defaults import create_default_config
from config.errors import ConfigError
from constants import CONFIG_FILE
from errors import ScgiServerError
from general.misc import create_thread_loop
from ioc_container import IocContainer
from startup.init_logging import init_logging


async def _main(comm_loop) -> None:
    try:
        config = _read_config_from_file(CONFIG_FILE)
        init_logging(config)
        _validate_config(config)

        container = IocContainer(
            config,
            asyncio.get_running_loop(),
            comm_loop,
            sys.argv[0]
        )

        await container.system_bootstrap.run()
    except ScgiServerError as e:
        logging.critical(e)
        return


def _read_config_from_file(config_file: str):
    cp = ConfigParser()

    try:
        if len(cp.read(config_file)) == 0:
            print("Configuration file '{}' not found, using default values".format(config_file))
    except ConfigError as e:
        raise ScgiServerError("Can't read config file") from e

    return Config.load(cp, create_default_config())


def _validate_config(config):
    if config.relay_config.relay_enabled or config.data_logger_config.datalogger_enabled:
        if config.dbase_config.dbase_enabled is False:
            raise ScgiServerError(
                "Invalid config - if relay or datalogger is enabled, database must be enabled"
            )

    if config.eth_config.enabled is False:
        if config.relay_config.relay_enabled or config.push_config.enabled:
            raise ScgiServerError(
                "Invalid config - if eth is disabled, relay and push can not be enabled"
            )


if __name__ == "__main__":
    # Create communication loop which will handle abus-related data flow throughout the application.
    # Everything else will be done on main thread (the one this code is currently running on)
    communication_loop, kill_communication_loop = create_thread_loop("CommunicationThread")

    try:
        main_loop = asyncio.new_event_loop()
        asyncio.set_event_loop(main_loop)
        main_loop.create_task(_main(communication_loop))
        main_loop.run_forever()
    except KeyboardInterrupt as exception:
        kill_communication_loop()
    except BaseException as exception:
        print(exception)
