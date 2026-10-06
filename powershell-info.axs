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


function add_readonly_command(name, description, ps_command) {
    var cmd = ax.create_command(name, description, name);
    cmd.setPreHook(function(id, cmdline, parsed_json, ...parsed_lines) {
        run_ps(id, cmdline, ps_command);
    });
    return cmd;
}

var cmd_hostname = add_readonly_command(
    "ps-hostname",
    "Show computer name",
    "$env:COMPUTERNAME"
);

var cmd_os = add_readonly_command(
    "ps-os",
    "Show Windows OS information",
    "Get-CimInstance Win32_OperatingSystem | Select-Object Caption,Version,BuildNumber,OSArchitecture"
);

var cmd_ip = add_readonly_command(
    "ps-ip",
    "Show IP configuration",
    "Get-NetIPConfiguration | Select-Object InterfaceAlias,IPv4Address,IPv4DefaultGateway,DNSServer"
);

var cmd_dns = add_readonly_command(
    "ps-dns",
    "Show DNS server configuration",
    "Get-DnsClientServerAddress | Select-Object InterfaceAlias,AddressFamily,ServerAddresses"
);

var cmd_routes = add_readonly_command(
    "ps-routes",
    "Show IPv4 routing table",
    "Get-NetRoute -AddressFamily IPv4 | Select-Object DestinationPrefix,NextHop,RouteMetric,InterfaceAlias"
);

var cmd_users = add_readonly_command(
    "ps-users",
    "List local users",
    "Get-LocalUser | Select-Object Name,Enabled,LastLogon"
);

var cmd_groups = add_readonly_command(
    "ps-groups",
    "List local groups",
    "Get-LocalGroup | Select-Object Name,Description"
);

var cmd_hotfixes = add_readonly_command(
    "ps-hotfixes",
    "List installed Windows hotfixes",
    "Get-HotFix | Select-Object HotFixID,Description,InstalledOn"
);

var cmd_disks = add_readonly_command(
    "ps-disks",
    "Show logical disk information",
    "Get-CimInstance Win32_LogicalDisk | Select-Object DeviceID,VolumeName,FileSystem,Size,FreeSpace"
);

var cmd_env = add_readonly_command(
    "ps-env",
    "Show environment variables",
    "Get-ChildItem Env: | Select-Object Name,Value"
);

var cmd_uptime = add_readonly_command(
    "ps-uptime",
    "Show system uptime information",
    "Get-CimInstance Win32_OperatingSystem | Select-Object LastBootUpTime,@{Name='Uptime';Expression={(Get-Date)-$_.LastBootUpTime}}"
);

var group = ax.create_commands_group(
    "PowerShell Info",
    [
        cmd_date,
        cmd_processes,
        cmd_services,
        cmd_drives,
        cmd_network,
        cmd_hostname,
        cmd_os,
        cmd_ip,
        cmd_dns,
        cmd_routes,
        cmd_users,
        cmd_groups,
        cmd_hotfixes,
        cmd_disks,
        cmd_env,
        cmd_uptime
    ]
);

ax.register_commands_group(
    group,
    ["NoNameAx"],
    ["windows"],
    []
);
