#-------------------------------------------------------------------------------
# Theme configuration parser
#-------------------------------------------------------------------------------

from dataclasses import dataclass
import os
from pathlib import Path
import pickle
import yaml

from color import Color


THEME_PATH = Path(os.path.expandvars('$XDG_CONFIG_HOME/theme/theme.yaml'))
CACHE_PATH = Path(os.path.expandvars('$XDG_CACHE_HOME/theme/theme.pickle'))


def is_readable_file(path: Path) -> bool:
    return os.path.isfile(path) and os.access(path, os.R_OK)


@dataclass
class ThemeConfig():
    colors: dict[str, Color]
    fonts: dict[str, str]


# TODO: Consider moving to the ThemeConfig class.
def pickle_config(config: ThemeConfig):
    try:
        with open(CACHE_PATH, 'w') as file:
            pickle.dump(config, file)

    except Exception as e:
        raise Exception(f'Error writing `{CACHE_PATH}`: {e}')


def unpickle_config() -> ThemeConfig:
    try:
        with open(CACHE_PATH, 'r') as file:
            return pickle.load(file)

    except Exception as e:
        raise Exception(f'Error reading `{CACHE_PATH}`: {e}')


def parse_config():
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
        pickle_config(config)

    except yaml.YAMLError as e:
        raise Exception(f'Error parsing `{THEME_PATH}`: {e}')

    except Exception as e:
        raise Exception(f'Error reading `{THEME_PATH}`: {e}')

    return config


def get_config() -> ThemeConfig:
    if is_readable_file(CACHE_PATH):
        return unpickle_config()

    return parse_config()


def get_color(name: str) -> Color:
    config = get_config()

    if name not in config.colors:
        raise ValueError(f'Color `{name}` not found in theme.')

    return config.colors[name]


if __name__ == "__main__":
    config = parse_config()
    print(config)