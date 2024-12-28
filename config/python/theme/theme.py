#-------------------------------------------------------------------------------
# Theme configuration parser
#-------------------------------------------------------------------------------

import os
from pathlib import Path
import yaml


def is_readable_file(path: Path) -> bool:
    return os.path.isfile(path) and os.access(path, os.R_OK)


def parse_config():
    file_path = Path(os.path.expandvars('$XDG_CONFIG_HOME/theme/theme.yaml'))

    if not is_readable_file(file_path):
        raise Exception(f'`{file_path}` is not readable.')

    try:
        with open(file_path, 'r') as file:
            file_contents = file.read()
            document = yaml.safe_load(file_contents)

    except yaml.YAMLError as e:
        raise Exception(f'Error parsing `{file_path}`: {e}')

    except Exception as e:
        raise Exception(f'Error reading `{file_path}`: {e}')

    return document


if __name__ == "__main__":
    config = parse_config()
    print(config)