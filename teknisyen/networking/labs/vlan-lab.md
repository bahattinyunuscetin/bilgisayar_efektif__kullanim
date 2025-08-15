## VLAN Lab

### Hedef
Ev ortamında VLAN segmentasyonu ile kullanıcı/servis/lab ağlarını ayırmak.

### Gereksinimler
- Yönetilebilir switch
- pfSense/opnSense

### Adımlar
1) VLAN10 (User), VLAN20 (Server), VLAN30 (Lab) oluştur
2) Trunk port → router; access portlar → ilgili cihazlar
3) pfSense’te arayüzleri/VLAN’ları ekle, DHCP’yi yapılandır
4) Kurallar: VLAN’lar arası erişimi kademeli aç/kapat, logla

### Doğrulama
- IP dağıtımı, DNS çözümü, internet çıkışı
- VLAN’lar arası erişim testleri (ping, curl)


