$ts = Get-Date -Format "yyyyMMdd-HHmmss"
$out = Join-Path $env:TEMP "logs-$ts"
New-Item -ItemType Directory -Force -Path $out | Out-Null

wevtutil epl System "$out\System.evtx"
wevtutil epl Application "$out\Application.evtx"
ipconfig /all > "$out\ipconfig.txt"
Get-Process | Sort-Object CPU -Descending | Select-Object -First 50 | Out-File "$out\top-processes.txt"
Get-Service | Out-File "$out\services.txt"

Compress-Archive -Path $out -DestinationPath "$out.zip" -Force
Write-Output "Logs archived to: $out.zip"


