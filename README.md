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
```

## Scope

This project intentionally ships only read-only administrative queries. It is intended for authorized lab, administrative, and defensive testing environments.

## License

MIT
