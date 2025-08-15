## Sorun Giderme (Runbook + Karar Ağacı)

### Genel Akış
1) Etki nedir? (kime/ne zamandır?)
2) Değişiklik var mıydı? (donanım/sürücü/güncelleme)
3) Loglar ve ölçümler (Event Viewer, journalctl, PerfMon/Grafana)
4) İzolasyon (ağ mı donanım mı uygulama mı?)
5) Geri dönüş planı (snapshot/imaj)

### Sık Senaryolar
- Boot olmuyor → BIOS, kablo, boot sırası, medya, UEFI/Legacy
- İnternet yok → DHCP/DNS, gateway, VLAN kuralı, DNS over HTTPS
- Mavi ekran/donma → RAM/PSU/termal, sürücü çakışması
- Disk dolu/yavaş → SMART, IOPS ölçümü, indeksleme ve log temizliği


