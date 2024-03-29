#!/usr/bin/env python
import subprocess
import os
from io import BytesIO
from pathlib import Path
from typing import List, Union

import pexpect

RESOLV_PATH = Path("/etc/resolv.conf")
DNS_SERVERS = ["nameserver 10.40.20.50", "nameserver 10.40.20.51"]
H_BREAK = f"\n{'-' * 50}\n"
VPN_USERNAME = "duy.nguyen@affinda.com"
VPN_PASSWORD = os.getenv('AFFINDA_PW')
VPN_CONFIG_PATH = Path("/home/rei/affinda.ovpn")
VPN_LOG = BytesIO()
VPN_KEY = "XXXXXXXXXXXXX"

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


def add_dns(dns_servers: List[str], dry_run=True):
    current_config = RESOLV_PATH.read_text()
    print(f"Current config:{H_BREAK}{current_config}{H_BREAK}")
    to_write = []
    for dns_server in dns_servers:
        if dns_server not in current_config:
            to_write.append(dns_server)

    if to_write:
        new_config = f"# Generated by connectvpn.py\n" + "\n".join(to_write) + "\n" + current_config
        print(f"New config:{H_BREAK}{new_config}{H_BREAK}")
        if dry_run:
            print(f"New config not written as dry_run=True")
        else:
            RESOLV_PATH.write_text(new_config)
            print(f"New config written.")
    else:
        print(f"Config already contains DNS servers {dns_servers}")


def disconnect_session(session_path: str):
    run_cmd(f"openvpn3 session-manage --path {session_path} --disconnect")


def get_auth_code(key: str):
    return run_cmd(f"oathtool {key} --base32 --totp", capture_output=True).stdout.decode().strip()

def vpn_kill_all():
    print("Killing all current vpn sessions")
    all_sessions_raw = run_cmd("openvpn3 sessions-list", capture_output=True)
    session_lines = all_sessions_raw.stdout.decode().splitlines()
    sessions_paths = [ln.strip().replace("Path: ", "") for ln in session_lines if "Path: " in ln]
    for session_path in sessions_paths:
        disconnect_session(session_path)


def vpn_login(username: str, password: str, config_path: Path):
    print(f"Starting vpn session for {username} using config {config_path}")
    p = pexpect.spawn(f'/bin/bash -c "openvpn3 session-start --config {config_path.absolute()}"')

    p.logfile_read = VPN_LOG
    p.expect(pattern="Auth User name")
    p.sendline(username)
    p.expect(pattern="Auth Password")
    p.sendline(password)
    p.expect(pattern="Enter Authenticator Code")
    key = input("one time auth code:")
    p.sendline(key)
    p.expect("Connected", timeout=5)
    p.wait()
    VPN_LOG.seek(0)
    print(f"Output:\n{VPN_LOG.read().decode()}")

if __name__ == '__main__':
    vpn_kill_all()
    vpn_login(username=VPN_USERNAME, password=VPN_PASSWORD, config_path=VPN_CONFIG_PATH)
    add_dns(DNS_SERVERS, dry_run=False)
