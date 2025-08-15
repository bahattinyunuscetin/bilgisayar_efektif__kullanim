## Linux Ağ Gecikmesi Runbook

### Ölçüm
- `ping`, `mtr`, `traceroute` ile yön
- `iperf3` ile bant genişliği
- `tcpdump` ile paket düşüşleri

### Analiz
- DNS gecikmesi → `dig +trace`
- Bufferbloat → sıraya girme/aqm (fq_codel)

### Düzeltmeler
- MTU/PMTUD kontrolü
- DNS cache/yerel resolver
- QoS ve kuyruk yapılandırmaları


