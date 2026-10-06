# Architecture

## Execution path

```text
AdaptixClient
    |
    | AxScript command
    v
powershell-info.axs
    |
    | ax.execute_alias(...)
    v
NoNameAx: ps run -o
    |
    v
powershell.exe -NoProfile -NonInteractive -Command <fixed query>
    |
    | stdout
    v
AdaptixClient task output
```

The extension reuses the process-execution and output-capture functionality already provided by NaX / NoNameAx. It does not implement a separate process runner.

## AxScript structure

`run_ps()` builds the common NoNameAx `ps run -o powershell.exe ...` invocation. The v0.2.0 commands also use `add_readonly_command()` to register fixed PowerShell queries with less duplicated AxScript code.

The command group is registered only for the `NoNameAx` agent type on Windows.

## Design scope

The repository is intentionally limited to predefined read-only host and administrative queries for authorized lab, administrative, and defensive testing. It does not provide a generic arbitrary PowerShell executor.
