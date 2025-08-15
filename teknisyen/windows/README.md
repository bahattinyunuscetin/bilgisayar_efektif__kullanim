## Windows Yönetimi ve Tanılama

### Çekirdek Konular
- Servisler ve başlangıç: `services.msc`, `Get-Service`, `sc.exe`
- Olay günlükleri: `Event Viewer`, `Get-WinEvent`
- Disk/FS: `diskmgmt.msc`, `diskpart`, `chkdsk`, `defrag`, `fsutil`
- Sistem dosyaları: `sfc /scannow`, `DISM /Online /Cleanup-Image /RestoreHealth`
- Şifreleme: `BitLocker` (TPM/Recovery), `manage-bde`
- Ağ: `ipconfig /all`, `Get-NetIPConfiguration`, `Test-NetConnection`
- Paketleşme: `winget` veya `choco` (yüklüyse)

### İmaj ve Geri Yükleme (Özet Runbook)
1) Kurtarma sürücüsü ve yedekler hazır mı? (dosyalar + sistem imajı)
2) `DISM` ile imaj yönetimi ve `wbadmin` ile yedekleme seçenekleri
3) Sürücü ve donanım uyumluluk kontrolü (Aygıt Yöneticisi)

### Hızlı Sorun Giderme
- Kaynak aşımı: `Task Manager` → CPU/RAM/Disk/Network sekmeleri, `Resource Monitor`
- Servis takılması: `sc query`, `Get-Service`, olay günlüklerinde Hata/Uyarı
- Ağ yok: `Get-NetAdapter`, `ipconfig /renew`, DNS: `Resolve-DnsName`

### Faydalı Komutlar
```
sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth
Get-WinEvent -LogName System -MaxEvents 50 | Format-List
Get-NetIPConfiguration
Test-NetConnection -ComputerName 8.8.8.8 -InformationLevel Detailed
```


