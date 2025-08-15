param(
    [string]$CsvPath = "..\checklists\inventory.csv",
    [string]$AssetId = "",
    [string]$DeviceName = $env:COMPUTERNAME,
    [string]$Role = "Workstation",
    [string]$Location = "Home-Office",
    [string]$Owner = "",
    [string]$PurchaseDate = "",
    [string]$WarrantyEnd = "",
    [string]$Notes = ""
)

function Escape-CsvValue([string]$value) {
    if ($null -eq $value) { return "" }
    $v = $value -replace '"', '""'
    if ($v -match "," -or $v -match '"' -or $v -match "\n") { return '"' + $v + '"' }
    return $v
}

function Get-OsInfo {
    $os = Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction SilentlyContinue
    if ($os) { return ($os.Caption + " " + $os.Version).Trim() }
    return ""
}

function Get-CpuInfo {
    $cpu = Get-CimInstance -ClassName Win32_Processor -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($cpu) { return $cpu.Name }
    return ""
}

function Get-RamGb {
    $cs = Get-CimInstance -ClassName Win32_ComputerSystem -ErrorAction SilentlyContinue
    if ($cs -and $cs.TotalPhysicalMemory) { return [string]([math]::Round($cs.TotalPhysicalMemory/1GB)) }
    return ""
}

function Get-SerialNumber {
    $bios = Get-CimInstance -ClassName Win32_BIOS -ErrorAction SilentlyContinue
    if ($bios -and $bios.SerialNumber) { return $bios.SerialNumber }
    $bb = Get-CimInstance -ClassName Win32_BaseBoard -ErrorAction SilentlyContinue
    if ($bb -and $bb.SerialNumber) { return $bb.SerialNumber }
    return ""
}

function Get-StorageSummary {
    $drives = Get-CimInstance -ClassName Win32_LogicalDisk -ErrorAction SilentlyContinue | Where-Object { $_.DriveType -eq 3 }
    $parts = @()
    foreach ($d in $drives) {
        if ($d.DeviceID -and $d.Size) {
            $sizeGb = [math]::Round($d.Size/1GB)
            $parts += ("{0} {1}GB" -f $d.DeviceID, $sizeGb)
        }
    }
    $models = Get-CimInstance -ClassName Win32_DiskDrive -ErrorAction SilentlyContinue | ForEach-Object { $_.Model } | Where-Object { $_ }
    $summary = @()
    if ($parts.Count -gt 0) { $summary += ($parts -join "; ") }
    if ($models.Count -gt 0) { $summary += ("Models: " + ($models -join "; ")) }
    return ($summary -join " | ")
}

function Get-NetworkMacs {
    $nics = Get-CimInstance -ClassName Win32_NetworkAdapter -ErrorAction SilentlyContinue | Where-Object { $_.PhysicalAdapter -and $_.MACAddress }
    $macs = $nics | ForEach-Object { $_.MACAddress } | Sort-Object -Unique
    return ($macs -join "; ")
}

function Get-IpAddresses {
    $cfgs = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -ErrorAction SilentlyContinue | Where-Object { $_.IPEnabled -eq $true }
    $ips = @()
    foreach ($c in $cfgs) { if ($c.IPAddress) { $ips += ($c.IPAddress | Where-Object { $_ -match "^\d+\.\d+\.\d+\.\d+$" }) } }
    $ips = $ips | Sort-Object -Unique
    return ($ips -join "; ")
}

$os = Get-OsInfo
$cpu = Get-CpuInfo
$ramGb = Get-RamGb
$serial = Get-SerialNumber
$storage = Get-StorageSummary
$macs = Get-NetworkMacs
$ips = Get-IpAddresses
$installed = ""
$lastAudit = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")

$dir = Split-Path -Parent $CsvPath
if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }

if (-not (Test-Path $CsvPath)) {
    $header = "AssetId,DeviceName,Role,Location,Owner,SerialNumber,PurchaseDate,WarrantyEnd,OS,CPU,RAM_GB,Storage,NetworkMACs,IP,InstalledSoftware,Notes,LastAuditDate"
    Set-Content -Path $CsvPath -Value $header -Encoding UTF8
}

$line = (
    (Escape-CsvValue $AssetId),
    (Escape-CsvValue $DeviceName),
    (Escape-CsvValue $Role),
    (Escape-CsvValue $Location),
    (Escape-CsvValue $Owner),
    (Escape-CsvValue $serial),
    (Escape-CsvValue $PurchaseDate),
    (Escape-CsvValue $WarrantyEnd),
    (Escape-CsvValue $os),
    (Escape-CsvValue $cpu),
    (Escape-CsvValue $ramGb),
    (Escape-CsvValue $storage),
    (Escape-CsvValue $macs),
    (Escape-CsvValue $ips),
    (Escape-CsvValue $installed),
    (Escape-CsvValue $Notes),
    (Escape-CsvValue $lastAudit)
) -join ","

Add-Content -Path $CsvPath -Value $line -Encoding UTF8
Write-Output ("Envanter satırı eklendi: {0}" -f $CsvPath)


