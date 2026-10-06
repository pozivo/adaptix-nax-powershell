# Changelog

## v0.2.0 - 2026-10-06

### Added

- Read-only host, OS, IP, DNS, route, local user/group, hotfix, disk, environment, and uptime queries.
- Shared helper for registering fixed PowerShell diagnostic commands.



## v0.1.0 - 2026-10-06

### Added

- Initial Adaptix v2 AxScript integration for NaX / NoNameAx.
- Read-only PowerShell commands: `ps-date`, `ps-info`, `ps-services`, `ps-drives`, and `ps-network`.
- Captured command output through NoNameAx `ps run -o`.

### Validation

All five commands were tested successfully against a Windows NoNameAx session. The agent remained stable and command output was returned to AdaptixClient.
