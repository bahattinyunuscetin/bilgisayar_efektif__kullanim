param(
    [Parameter(Mandatory=$true)] [string]$Source,
    [Parameter(Mandatory=$true)] [string]$Destination
)

New-Item -ItemType Directory -Force -Path $Destination | Out-Null
robocopy $Source $Destination /MIR /R:2 /W:3 /XD ".git" "node_modules" /LOG+:"$Destination\backup.log"
Write-Output "Backup completed: $Source -> $Destination"


