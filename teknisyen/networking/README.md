## Ağ (Networking)

### Temeller
- OSI katmanları, TCP/IP, NAT, DHCP, DNS, VLAN

### Hızlı Araçlar
- `ipconfig`/`ip`, `ping`, `tracert`/`traceroute`, `nslookup`/`dig`, `tcpdump`, `Wireshark`

### Wireshark Filtreleri
```
ip.addr == 192.168.1.10
dns && ip.ttl < 10
http.request || http.response
tcp.flags.reset == 1
```

### pfSense Örnekleri
- Temel kural: LAN → Any → Allow (başlangıç), sonrasında en az ayrı VLAN’lar
- Port yönlendirme ve NAT: Servis başına kural + log takibi


