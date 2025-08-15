## Donanım Teşhis ve Bakım

### Kontrol Listesi
- Görsel kontrol: kablolar, toz, soğutma, fan yönleri
- BIOS/UEFI: XMP/EXPO profilleri, SATA/NVMe modları, Secure Boot
- Depolama: SMART (`smartctl`), yüzey testi, TBW/sağlık takibi
- RAM: `memtest86` (en az 2 geçiş), kararlılık testi
- CPU/GPU: stres testi (`stress-ng`, `OCCT`), sıcaklık/güç ölçümleri
- PSU: watt kapasitesi ve 12V/5V hat stabilitesi (mümkünse ölçüm)

### Tipik Sorun → Eylem
- Ani reset/BSOD: PSU, RAM ve sıcaklık testi
- Yavaşlama: disk health + termal throttling kontrolü
- Boot sorunları: BIOS güncelleme, boot sırası, kablo/port değişimi


