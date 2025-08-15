## Karar Ağacı: Ağ Problemleri

```
[Bağlantı yok]
  -> [Wi-Fi mi Ethernet mi?]
     -> [Ethernet]
        -> Kablosuz devre dışı? DHCP alınıyor mu? IP/Subnet/Gateway doğru mu?
        -> Gateway ping? DNS çözümü? İnternet ping?
     -> [Wi‑Fi]
        -> Sinyal gücü? Roaming? DHCP? Captive portal?
  -> [Sadece bazı siteler]
     -> DNS sorunu mu? DoH/DoT devrede mi? TTL/Cache?
  -> [Yük altında kopma]
     -> Bufferbloat? QoS/AQM (fq_codel) etkinleştir
```


