#-------------------------------------------------------------------------------
# Theme configuration parser
#-------------------------------------------------------------------------------

from dataclasses import dataclass
import os
from pathlib import Path
import yaml

from color import Color


def is_readable_file(path: Path) -> bool:
    return os.path.isfile(path) and os.access(path, os.R_OK)


@dataclass
class ThemeConfig():
    colors: dict[str, Color]
    fonts: dict[str, str]


def parse_config():
    file_path = Path(os.path.expandvars('$XDG_CONFIG_HOME/theme/theme.yaml'))

    if not is_readable_file(file_path):
        raise Exception(f'`{file_path}` is not readable.')

    try:
        colors = {}
        fonts = {}

        with open(file_path, 'r') as file:
            file_contents = file.read()

            document = yaml.safe_load(file_contents)

            for k, v in document['colors'].items():
                colors[k] = Color(v)

            fonts = document.get('fonts', {})

        config = ThemeConfig(colors=colors, fonts=fonts)

    except yaml.YAMLError as e:
        raise Exception(f'Error parsing `{file_path}`: {e}')

    except Exception as e:
        raise Exception(f'Error reading `{file_path}`: {e}')

    return config


if __name__ == "__main__":
    config = parse_config()
    print(config)