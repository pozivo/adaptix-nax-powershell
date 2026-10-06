# Command Reference

All commands are fixed, read-only administrative queries. The extension intentionally does not expose an arbitrary PowerShell command interface.

| Command | Purpose | PowerShell query |
| --- | --- | --- |
| `ps-date` | System date/time | `Get-Date` |
| `ps-info` | Running processes | `Get-Process` with selected fields |
| `ps-services` | Windows services | `Get-Service` with selected fields |
| `ps-drives` | Filesystem PS drives | `Get-PSDrive -PSProvider FileSystem` |
| `ps-network` | TCP endpoints | `Get-NetTCPConnection` with selected fields |
| `ps-hostname` | Computer name | `$env:COMPUTERNAME` |
| `ps-os` | OS/version/build/architecture | `Win32_OperatingSystem` via CIM |
| `ps-ip` | IP configuration | `Get-NetIPConfiguration` |
| `ps-dns` | DNS server configuration | `Get-DnsClientServerAddress` |
| `ps-routes` | IPv4 routes | `Get-NetRoute -AddressFamily IPv4` |
| `ps-users` | Local users | `Get-LocalUser` |
| `ps-groups` | Local groups | `Get-LocalGroup` |
| `ps-hotfixes` | Installed hotfixes | `Get-HotFix` |
| `ps-disks` | Logical disks | `Win32_LogicalDisk` via CIM |
| `ps-env` | Environment variables | `Get-ChildItem Env:` |
| `ps-uptime` | Last boot and uptime | `Win32_OperatingSystem` via CIM |

## Notes

Some cmdlets depend on the Windows/PowerShell version and modules available on the host. Output can also vary with the privileges of the NoNameAx process. Commands such as `ps-services`, `ps-network`, and `ps-env` may return large result sets.
