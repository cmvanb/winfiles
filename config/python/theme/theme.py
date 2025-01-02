#-------------------------------------------------------------------------------
# Theme configuration parser
#-------------------------------------------------------------------------------

from dataclasses import dataclass
import os
from pathlib import Path
import pickle

import luadata
import yaml

from color import Color


THEME_PATH = Path(os.path.expandvars('$XDG_CONFIG_HOME/theme/theme.yaml'))
CACHE_PATH = Path(os.path.expandvars('$XDG_CACHE_HOME/theme/theme.pickle'))
LUA_DICT_PATH = Path(os.path.expandvars('$XDG_CACHE_HOME/theme/theme.lua'))


@dataclass
class ThemeConfig():
    colors: dict[str, Color]
    fonts: dict[str, str]

    @staticmethod
    def pickle(config):
        try:
            CACHE_PATH.parent.mkdir(parents=True, exist_ok=True)

            with open(CACHE_PATH, 'wb') as file:
                pickle.dump(config, file)

        except Exception as e:
            raise Exception(f'Error writing `{CACHE_PATH}`: {e}')

    @staticmethod
    def unpickle():
        try:
            with open(CACHE_PATH, 'rb') as file:
                return pickle.load(file)

        except Exception as e:
            raise Exception(f'Error reading `{CACHE_PATH}`: {e}')

    @staticmethod
    def lua_dict(config):
        lua_dict = {
            'colors': { k: str(v) for k, v in config.colors.items() },
            'fonts': config.fonts,
        }

        try:
            LUA_DICT_PATH.parent.mkdir(parents=True, exist_ok=True)
            luadata.write(LUA_DICT_PATH, lua_dict, encoding='utf-8', indent='  ', prefix='return ')

        except Exception as e:
            raise Exception(f'Error writing `{LUA_DICT_PATH}`: {e}')

    @staticmethod
    def parse():
        if not is_readable_file(THEME_PATH):
            raise Exception(f'`{THEME_PATH}` is not readable.')

        try:
            colors = {}
            fonts = {}

            with open(THEME_PATH, 'r') as file:
                file_contents = file.read()
                parse_dict = yaml.safe_load(file_contents)

                for k, v in parse_dict['colors'].items():
                    colors[k] = Color(v)

                fonts = parse_dict.get('fonts', {})

            config = ThemeConfig(colors=colors, fonts=fonts)
            ThemeConfig.pickle(config)
            ThemeConfig.lua_dict(config)

        except yaml.YAMLError as e:
            raise Exception(f'Error parsing `{THEME_PATH}`: {e}')

        except Exception as e:
            raise Exception(f'Error reading `{THEME_PATH}`: {e}')

        return config


def is_readable_file(path: Path) -> bool:
    return os.path.isfile(path) and os.access(path, os.R_OK)


def get_config() -> ThemeConfig:
    if is_readable_file(CACHE_PATH):
        return ThemeConfig.unpickle()

    return ThemeConfig.parse()


def get_color(key: str) -> Color:
    config = get_config()

    if key not in config.colors:
        raise ValueError(f'Color `{key}` not found in theme.')

    return config.colors[key]


def get_font(key: str) -> str:
    config = get_config()

    if key not in config.fonts:
        raise ValueError(f'Font `{key}` not found in theme.')

    return config.fonts[key]


def color_hash(name: str) -> str:
    return get_color(name).with_hash()


def color_zerox(name: str) -> str:
    return get_color(name).with_zerox()