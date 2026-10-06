# Compatibility

This document distinguishes **tested compatibility** from versions that may work but have not been validated by this project.

## Reference configuration

The current script was developed and tested for the following GitHub configuration:

| Component | Repository | Branch used | Status |
| --- | --- | --- | --- |
| Adaptix Framework | `Adaptix-Framework/AdaptixC2` | `testing-v2.0` | **Supported / reference branch** |
| NaX / NoNameAx | `MaorSabag/NaX` | `adaptix-v2-sync` | **Supported / reference branch** |
| Extension | `pozivo/adaptix-nax-powershell` | `main` | Current development version |
| Target | Windows + Windows PowerShell | — | Required |

Both upstream branch names were verified on GitHub when this compatibility document was written.

## Compatibility matrix

| Configuration | Compatibility |
| --- | --- |
| Adaptix `testing-v2.0` + NaX `adaptix-v2-sync` | **Tested / supported** |
| Adaptix v2-compatible commits newer than the tested branch state | **Potentially compatible, not guaranteed** |
| Other NaX branches | **Not tested** |
| Adaptix main / v1.x | **Not tested; do not assume compatibility** |
| Other Adaptix agents (Beacon, Gopher, etc.) | **Not supported by this script** |
| Linux/macOS agents | **Not supported** |

## Why compatibility is specific

The AxScript registers its command group specifically for the `NoNameAx` Windows agent and delegates execution to NaX's existing `ps run -o` command. Compatibility therefore depends on both the Adaptix AxScript API used by the script and the NoNameAx command syntax/behavior supplied by NaX.

A future upstream change to `ax.create_command`, `setPreHook`, `ax.execute_alias`, command-group registration, or NaX's `ps run -o` interface may require changes here.

## Tested functionality

The original v0.1.0 command set (`ps-date`, `ps-info`, `ps-services`, `ps-drives`, and `ps-network`) has been exercised end-to-end on the reference configuration. The newer v0.2.0 diagnostic commands must remain marked as unvalidated until individually tested.

## Reporting another compatible version

If you test another Adaptix or NaX branch/commit successfully, include the Adaptix branch/commit, NaX branch/commit, Windows version, PowerShell version, and commands tested when opening an issue or pull request. This lets the compatibility matrix be expanded with reproducible results rather than assumptions.
