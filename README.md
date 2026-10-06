# adaptix-nax-powershell

Small AxScript extension for **Adaptix Framework v2** and **NaX / NoNameAx** that adds a set of read-only PowerShell information commands.

## Compatibility

- Adaptix Framework v2
- NaX branch `adaptix-v2-sync`
- NoNameAx Windows agents
- PowerShell available on the target host

The extension reuses NoNameAx's existing `ps run -o` execution path and does not add a second process execution implementation.

## Commands

| Command | Description |
| --- | --- |
| `ps-date` | Show system date/time |
| `ps-info` | List running processes |
| `ps-services` | List Windows services |
| `ps-drives` | List filesystem drives |
| `ps-network` | Show TCP connections |
| `ps-hostname` | Show computer name |
| `ps-os` | Show Windows version/build |
| `ps-ip` | Show IP configuration |
| `ps-dns` | Show DNS configuration |
| `ps-routes` | Show IPv4 routes |
| `ps-users` | List local users |
| `ps-groups` | List local groups |
| `ps-hotfixes` | List installed hotfixes |
| `ps-disks` | Show logical disks |
| `ps-env` | Show environment variables |
| `ps-uptime` | Show boot time and uptime |

## Installation

Clone the repository:

```bash
git clone https://github.com/pozivo/adaptix-nax-powershell.git
```

Then load `powershell-info.axs` from the AdaptixClient Script Manager.

Example path:

```text
/home/<user>/adaptix-nax-powershell/powershell-info.axs
```

After loading it, open a NoNameAx session and run:

```text
help
```

You should see the **PowerShell Info** command group.

Try:

```text
ps-date
ps-info
ps-services
ps-drives
ps-network
ps-hostname
ps-os
ps-ip
ps-dns
ps-routes
ps-users
ps-groups
ps-hotfixes
ps-disks
ps-env
ps-uptime
```

## Tested

Validated on 2026-10-06 with Adaptix Framework v2 and NaX / NoNameAx on Windows. The following commands were exercised successfully end-to-end:

- `ps-date`: returned the system date/time.
- `ps-info`: returned the running process list.
- `ps-services`: returned Windows service status/name/display name data.
- `ps-drives`: returned filesystem drive information.
- `ps-network`: returned TCP connection/listener information.

The tests confirmed the AxScript -> NoNameAx `ps run -o` -> PowerShell -> captured output path while keeping the agent session stable.

## Scope

This project intentionally ships only read-only administrative queries. It is intended for authorized lab, administrative, and defensive testing environments.

## License

MIT
