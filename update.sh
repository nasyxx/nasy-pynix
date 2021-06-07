#!/usr/bin/env nix-shell
#!nix-shell -i python -p "python39.withPackages(p: [ p.tomlkit p.nvchecker ])"
# -*- coding: utf-8 -*-

r"""
Python ♡ Nasy.

    |             *         *
    |                  .                .
    |           .                              登
    |     *                      ,
    |                   .                      至
    |
    |                               *          思
    |          |\___/|
    |          )    -(             .           聖 ·
    |         =\ -   /=
    |           )===(       *
    |          /   - \
    |          |-    |
    |         /   -   \     0.|.0
    |  NASY___\__( (__/_____(\=/)__+1s____________
    |  ______|____) )______|______|______|______|_
    |  ___|______( (____|______|______|______|____
    |  ______|____\_|______|______|______|______|_
    |  ___|______|______|______|______|______|____
    |  ______|______|______|______|______|______|_
    |  ___|______|______|______|______|______|____

author   : Nasy https://nasy.moe
date     : Mar 10, 2021
email    : Nasy <nasyxx+python@gmail.com>
filename : update.py
project  : nasy-pynix
license  : GPL-3.0+

Update module version from pypi.

"""
# Standard Library
import json
import re
from pathlib import Path
from subprocess import run

# Others
from tomlkit import item

HV = re.compile('(.*)version = ".*?";(.*)sha256 = ".*?";(.*)', re.DOTALL)

SP = {"nblack": "black"}
IGNORES = {"njedi.nix", "default.nix", "scipy.nix"}
WHEEL = {"torch"}


def update_toml() -> None:
    """Update version.toml file."""
    with open("version.toml", "w") as f:
        f.write(
            item(
                {
                    "__config__": {
                        "oldver": "old_ver.json",
                        "newver": "new_ver.json",
                    }
                }
                | dict(
                    map(
                        lambda name: (
                            name,
                            {"source": "pypi", "pypi": SP.get(name, name)},
                        ),
                        map(
                            lambda p: p.stem,
                            filter(
                                lambda p: p.name not in IGNORES,
                                Path("./python-modules").glob("*.nix"),
                            ),
                        ),
                    )
                )
            ).as_string()
        )


def update_version() -> None:
    """Upadte version file with nvchecker."""
    run(["nvchecker", "-c", "version.toml"])


def update_hash(name: str, version: str) -> str:
    """Update hash."""
    sfs = name in WHEEL and "-cp39-none-macosx_10_9_x86_64.whl" or ".tar.gz"
    sop = name in WHEEL and "cp39" or "source"
    return (
        run(
            [
                "nix-prefetch-url",
                f"https://files.pythonhosted.org/packages/{sop}/"
                f"{name[0]}/{name}/{name}-{version}{sfs}",
            ],
            capture_output=True,
        )
        .stdout.strip()
        .decode()
    )


def update_file(nv: tuple[str, str]) -> None:
    """Update file."""
    name, version = nv
    path = Path("./python-modules") / f"{name}.nix"
    text = path.rename(path.with_suffix(".bk")).read_text()
    name = SP.get(name, name)
    hsh = update_hash(name, version)

    print(f"Update {name} to {version} - {hsh}")

    path.write_text(
        HV.sub(fr'\1version = "{version}";' fr'\2sha256 = "{hsh}";\3', text)
    )


def update_files() -> None:
    """Update files."""
    any(
        map(
            update_file,
            json.loads(Path("./new_ver.json").read_bytes()).items(),
        )
    )


def main() -> None:
    """Run the updater."""
    update_toml()
    update_version()
    update_files()


if __name__ == "__main__":
    main()

# Local Variables:
# mode: Python
# End:
