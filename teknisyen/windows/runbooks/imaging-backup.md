## Windows İmaj ve Yedekleme Runbook

### Hedef
Sistemin geri dönüşünü garanti etmek: imaj + dosya yedekleme.

### İmaj Stratejisi
- Araç: Macrium Reflect / Veeam Agent / Yerleşik `wbadmin`
- Sıklık: Aylık tam imaj + haftalık farklı
- Konum: Harici disk + NAS

### Dosya Yedekleme
- Günlük fark/delta (Robocopy/rsync)
- Hariç tut: `.git`, `node_modules`, cache klasörleri

### Geri Yükleme Tatbikatı
1) Kurtarma medyası ile boot
2) Son tam + farklı yedekten dönüş
3) Açılış sonrası doğrulama: sürücüler, aktivasyon, kritik uygulamalar


