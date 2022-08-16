import os
import sys
import json
from typing import Callable, Dict, List, NewType, Union, Optional
from copy import deepcopy

EnvType = NewType("EnvType", Dict[str, Dict[str, Union[str, Dict[str, str]]]])
ConfType = NewType("ConfType", Dict[str, Union[str, EnvType]])


def link(conf_key: str, conf: Dict[str, str]) -> None:
    for src, dest in conf.items():
        src = os.path.abspath(f"{conf_key}/{src}")
        dest = os.path.expanduser(dest)

        if not os.path.exists(src):
            print("[WARN] The file or foler path does not exists")
            continue

        if not os.path.islink(dest):
            directory_path: str = os.path.dirname(dest)
            os.makedirs(directory_path, exist_ok=True)
        else:
            os.unlink(dest)

        os.symlink(src, dest, os.path.isfile(src))


def main(env: Optional[str] = None):
    conf_file: ConfType = {}
    with open("envs.json", "r") as f:
        conf_file: ConfType = json.loads(f.read())
    backup_conf: ConfType = deepcopy(conf_file)

    if env not in conf_file["envs"]:
        print(f"{env} does not exists in envirioments.")
        return

    env_name: str = env if not env == None else conf_file["default_env"]
    selected_env: EnvType = conf_file["envs"][env_name]
    if "take" in selected_env and selected_env["take"] in conf_file["envs"]:
        selected_env = {**conf_file["envs"][selected_env["take"]], **selected_env}

    if "links" in selected_env:
        link(env_name, selected_env["links"])

    conf_file["current_env"] = env_name

    with open("envs.json", "w") as f:
        try:
            f.write(json.dumps(conf_file, indent=4))
        except:
            f.write(json.dumps(backup_conf, indent=4))
            raise RuntimeError(
                "A storage error has occurred, check the configured data"
            )


if __name__ == "__main__":
    args: List[str] = sys.argv
    if "help" in args:
        print(
            "Usage:\n"
            f'    "python3 {args[0]} <env_key: str>" to change the envirioment\n'
            f'    "python3 {args[0]} init" to initialize the configuration file'
        )
    elif "init" in args:
        if os.path.exists("envs.json"):
            print("The configuration file is already initialized")
            sys.exit()

        conf_file: ConfType = {
            "envs": {"default": {"links": {}, "take": ""}},
            "current_env": "",
            "default_env": "default",
        }

        with open("envs.json", "w") as f:
            f.write(json.dumps(conf_file))
    else:
        main(args[1] if len(args) == 2 else None)
