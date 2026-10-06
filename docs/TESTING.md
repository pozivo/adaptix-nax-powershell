# Testing

## Validated baseline

The v0.1.0 execution path was validated on 2026-10-06 using Adaptix Framework v2, NaX / NoNameAx, and a Windows target.

The following commands completed end-to-end and returned output to AdaptixClient:

- `ps-date`
- `ps-info`
- `ps-services`
- `ps-drives`
- `ps-network`

The test confirmed the path AxScript -> NoNameAx `ps run -o` -> PowerShell -> captured stdout. The NoNameAx session remained stable during these tests.

## v0.2.0 validation checklist

After loading the current script, test the newer commands individually:

```text
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

Do not mark these commands as validated until their output has been checked on a NoNameAx Windows session.

## Troubleshooting

If a command is registered but produces no expected output, first run a previously validated command such as `ps-date`. If that also fails, check the NoNameAx session and Adaptix task status. If only one newer command fails, check whether the underlying PowerShell cmdlet exists on that Windows version and whether the current process has permission to query it.
