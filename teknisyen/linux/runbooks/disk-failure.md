## Linux Disk Arızası Runbook

### Tanı
- SMART: `smartctl -a /dev/sdX`
- Kernel log: `dmesg -T | egrep -i "error|failed|ata|nvme"`
- I/O hataları: `iostat -xz 1`

### İzolasyon
- Kablo/port değişimi, güç kontrolü
- Farklı denetleyici/slot denemesi

### Eylem
- Veriyi ayır: `rsync --inplace --partial --info=progress2`
- Yıpranmış disk: sadece okuma, yazmayı minimumda tut
- Değiştir, tekrar SMART/bench doğrula


