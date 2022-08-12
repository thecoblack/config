import os
import sys
import json

from typing import List, Dict, Callable, Union


def create_link(src: str, dest: str) -> None:
    pass


def folder(conf: Dict[str, str]) -> None:
    for src, dest in conf.items():
        if not os.path.exists(dest):
            os.mkdir(dest) 


def file(conf: Dict[str, str]) -> None:
    pass


def compare_envs(curr_env_conf: str) -> None:
    pass


def main(args: List[str]):
    envs: Dict[str, Dict[str, Dict[str, str]]] = {}
    curr_env: str = ""
    with open('envs.json', 'r') as f:
        json_content: Dict[str, Union[Dict, str]] = json.loads(f.read())
        curr_env, envs = json_content["current_env"], json_content["envs"]

    if "-u" in args:
        # Compare the env saved in the envs folder 
        # with current configuration. If detects changes
        # in the current configuration, update 
        # the env saved configuration
        pass

    actions: Dict[str, Callable] = {
        "folder": folder,
        "file": file 
    }
    env_conf: Dict[str, Dict[str, str]] = envs[args[0]]
    for key, conf in env_conf.items():
        actions[key](conf)


if __name__ == "__main__":
    main(sys.argv[1:])
