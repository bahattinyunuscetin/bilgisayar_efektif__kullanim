## Linux Komut Hızlı Fişi

```bash
# Kaynak
top -o %CPU
free -h
vmstat 1 5

# Disk/FS
lsblk; df -h; iostat -xz 1 3

# Ağ
ip a; ip r; ss -tulpn
dig example.com +trace

# Log
journalctl -p err -S "-1h" --no-pager
```


