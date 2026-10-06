var metadata = {
    name: "PowerShell Info - NoNameAx",
    description: "Read-only PowerShell administrative queries for Adaptix v2 + NaX NoNameAx"
};

function run_ps(id, cmdline, command) {
    ax.execute_alias(
        id,
        cmdline,
        'ps run -o powershell.exe -NoProfile -NonInteractive -Command "' + command + '"',
        "PowerShell: " + command
    );
}

var cmd_date = ax.create_command(
    "ps-date",
    "Show system date/time",
    "ps-date"
);
cmd_date.setPreHook(function(id, cmdline, parsed_json, ...parsed_lines) {
    run_ps(id, cmdline, "Get-Date");
});

var cmd_processes = ax.create_command(
    "ps-info",
    "List running processes",
    "ps-info"
);
cmd_processes.setPreHook(function(id, cmdline, parsed_json, ...parsed_lines) {
    run_ps(id, cmdline, "Get-Process | Select-Object Id,ProcessName,CPU");
});

var cmd_services = ax.create_command(
    "ps-services",
    "List Windows services",
    "ps-services"
);
cmd_services.setPreHook(function(id, cmdline, parsed_json, ...parsed_lines) {
    run_ps(id, cmdline, "Get-Service | Select-Object Status,Name,DisplayName");
});

var cmd_drives = ax.create_command(
    "ps-drives",
    "List filesystem drives",
    "ps-drives"
);
cmd_drives.setPreHook(function(id, cmdline, parsed_json, ...parsed_lines) {
    run_ps(id, cmdline, "Get-PSDrive -PSProvider FileSystem");
});

var cmd_network = ax.create_command(
    "ps-network",
    "Show TCP connections",
    "ps-network"
);
cmd_network.setPreHook(function(id, cmdline, parsed_json, ...parsed_lines) {
    run_ps(
        id,
        cmdline,
        "Get-NetTCPConnection | Select-Object LocalAddress,LocalPort,RemoteAddress,RemotePort,State"
    );
});

var group = ax.create_commands_group(
    "PowerShell Info",
    [
        cmd_date,
        cmd_processes,
        cmd_services,
        cmd_drives,
        cmd_network
    ]
);

ax.register_commands_group(
    group,
    ["NoNameAx"],
    ["windows"],
    []
);
