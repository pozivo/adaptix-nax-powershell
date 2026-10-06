# Installation

## Requirements

- Adaptix Framework v2
- NaX from the `adaptix-v2-sync` branch
- A Windows NoNameAx agent
- Windows PowerShell available on the managed host

The extension is an AxScript loaded by AdaptixClient. It does not require rebuilding NoNameAx.

## Install

Clone the repository:

```bash
git clone https://github.com/pozivo/adaptix-nax-powershell.git
cd adaptix-nax-powershell
```

In AdaptixClient, open **Script Manager**, choose **Load Script**, and select `powershell-info.axs`.

Open a Windows NoNameAx session and run:

```text
help
```

The **PowerShell Info** command group should be present.

## Update

```bash
cd ~/C2/adaptix-nax-powershell
git pull --ff-only
```

Reload `powershell-info.axs` in Script Manager after updating.

## Smoke test

Start with:

```text
ps-date
ps-hostname
ps-os
ps-uptime
```

A successful command is queued through NoNameAx's existing `ps run -o` path and returns PowerShell output to AdaptixClient.
