## Windows Temiz Kurulum Runbook

### Ön Hazırlık
- Yedekler alındı (belgeler, tarayıcı profilleri, lisans anahtarları)
- Sürücü/UEFI güncel, BIOS varsayılanları yüklendi
- Kurulum medyası hazır (Rufus ile UEFI/GPT)

### Kurulum
1) UEFI’de doğru boot aygıtını seç
2) Disk bölümleme: EFI (100–300 MB), MSR (16 MB), C: (NTFS), D: (veri)
3) İlk açılışta Microsoft hesabı/yerel hesap seçimi ve PIN

### Sürücü ve Güncellemeler
- Windows Update → tüm kritik güncellemeler
- OEM sürücüler (yonga seti, GPU, ağ)

### Sertleştirme (Hızlı)
- BitLocker etkin, kurtarma anahtarı yedeklendi
- SmartScreen/Defender açık, Otomatik güncellemeler etkin

### Sonrası
- Uygulama kurulumu listesi ve `winget import` json (varsa)
- Sistem imajı alma ve geri yükleme provası


