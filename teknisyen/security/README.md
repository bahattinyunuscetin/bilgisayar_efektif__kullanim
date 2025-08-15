## Güvenlik ve Sertleştirme

### Windows Sertleştirme
- Güçlü parolalar + BitLocker + Secure Boot
- `AppContainer`/`WDAC` giriş, Defender ayarları, SmartScreen
- Tarama: `PowerShell` ile zayıf yerel hesap denetimi

### Linux Sertleştirme
- `ssh` hardening (anahtar, `PermitRootLogin no`, `fail2ban`)
- Kernel parametreleri (sysctl), minimal servis yüzeyi
- Paket güncellemeleri ve otomatik güvenlik yamaları

### Uygulama Güvenliği
- Secrets yönetimi, SAST/DAST, bağımlılık açıkları
- TLS ve mTLS, CSP ve güvenli başlıklar


