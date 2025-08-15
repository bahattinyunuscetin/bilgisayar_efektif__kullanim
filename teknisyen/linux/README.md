## Linux Yönetimi ve Tanılama

### Çekirdek Konular
- Servis yönetimi: `systemctl`, `journalctl`
- Kaynak analizi: `top/htop`, `vmstat`, `iostat`, `free`, `sar`
- Ağ: `ip`, `ss`, `tcpdump`, `dig`, `traceroute`
- FS ve depolama: `lsblk`, `blkid`, `parted`, `lvm`, `btrfs`, `zfs`
- İzleme/Debug: `strace`, `ltrace`, `perf`, eBPF araçları

### Btrfs Anlık Görüntü (Örnek)
```
sudo btrfs subvolume snapshot /@ /@snapshot-pre-update
sudo pacman -Syu  # veya apt/yum/dnf
# Sorun olursa: snapshot’tan geri dön
```

### Journal Kayıtları
```
journalctl -u servis-adi.service -b -n 200 --no-pager
journalctl -p err -S "-1h" --no-pager
```

### Ağ Teşhisi
```
ip a; ip r
ss -tulpn
sudo tcpdump -i eth0 port 53 -vv
dig example.com +trace
```


