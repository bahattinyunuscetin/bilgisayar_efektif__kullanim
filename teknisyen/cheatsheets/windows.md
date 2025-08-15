## Windows Komut Hızlı Fişi

```powershell
# Ağ
ipconfig /all
Test-NetConnection -ComputerName 8.8.8.8 -InformationLevel Detailed
Get-NetIPConfiguration

# Sistem dosyaları
sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth

# Servisler
Get-Service | ? {$_.Status -ne 'Running'}
Get-WinEvent -LogName System -MaxEvents 50 | fl
```


