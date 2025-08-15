param(
    [string]$TaskName = "CollectLogsDaily",
    [string]$StartTime = "21:00",
    [string]$ScriptPath = "$(Split-Path -Parent $MyInvocation.MyCommand.Path)\collect-logs.ps1"
)

$time = [DateTime]::ParseExact($StartTime, "HH:mm", $null)

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$ScriptPath`""
$trigger = New-ScheduledTaskTrigger -Daily -At $time
$principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -RunLevel Highest -LogonType Interactive

try {
    if (Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue) {
        Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false | Out-Null
    }
    Register-ScheduledTask -TaskName $TaskName -Action $action -Trigger $trigger -Principal $principal | Out-Null
    Write-Output "Scheduled task registered: $TaskName at $StartTime"
} catch {
    Write-Error $_
}


