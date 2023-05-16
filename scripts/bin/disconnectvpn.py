#!/usr/bin/env python
import subprocess
from pathlib import Path
from typing import List, Union

def run_cmd(cmd: str, cwd: Union[Path, str] = None, capture_output=False):
    if isinstance(cwd, Path):
        cwd = str(cwd.absolute())
    cwd = cwd or Path(__file__).parent
    # print(f"Running cmd: \n{cmd}")
    r = subprocess.run(cmd, cwd=cwd, shell=True, capture_output=capture_output)
    if r.returncode != 0:
        print("ERROR: " + r.stderr.decode())
        raise Exception(f"Exception raised when calling cmd: {cmd}\n{r.stderr.decode()}")
    return r

def disconnect_session(session_path: str):
    run_cmd(f"openvpn3 session-manage --path {session_path} --disconnect")

def vpn_kill_all():
    print("Killing all current vpn sessions")
    all_sessions_raw = run_cmd("openvpn3 sessions-list", capture_output=True)
    session_lines = all_sessions_raw.stdout.decode().splitlines()
    sessions_paths = [ln.strip().replace("Path: ", "") for ln in session_lines if "Path: " in ln]
    for session_path in sessions_paths:
        disconnect_session(session_path)

if __name__ == '__main__':
    vpn_kill_all()
    run_cmd("sed -i '/connectvpn\.py/d' /etc/resolv.conf")
    run_cmd("sed -i '/10\.40\.20\.\(50\|51\)/d' /etc/resolv.conf")
