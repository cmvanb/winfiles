#-------------------------------------------------------------------------------
# Template utilities
#-------------------------------------------------------------------------------

import argparse
from mako.template import Template
from pathlib import Path


def deploy_mako_template(template_path: Path, target_path: Path):
    try:
        with open(template_path, 'r') as f:
            template = Template(f.read())

    except Exception as e:
        raise Exception(f'Error reading `{template_path}`: {e}')

    try:
        rendered = template.render()

    except Exception as e:
        raise Exception(f'Error rendering `{template_path}`: {e}')

    try:
        with open(target_path, 'w') as f:
            f.write(rendered)

    except Exception as e:
        raise Exception(f'Error writing `{target_path}`: {e}')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Deploy Mako template.')
    parser.add_argument(
        'template_path',
        type=Path,
        help='The path of the mako template.'
    )
    parser.add_argument(
        'target_path',
        type=Path,
        help='The path to render the template to.'
    )
    args = parser.parse_args()

    deploy_mako_template(args.template_path, args.target_path)