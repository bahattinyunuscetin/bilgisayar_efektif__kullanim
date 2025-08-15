## Task Scheduler ile Yedekleme Zamanlama (backup.ps1)

### Ön Koşul
- `teknisyen\scripts\backup.ps1` dosyasını test ettin.

### Adımlar
1) Task Scheduler → Create Task
2) General: Run whether user is logged on or not, Run with highest privileges
3) Triggers: Daily, saat 20:00 (örnek)
4) Actions: Start a program → Program/Script: `powershell.exe`
   - Arguments: `-NoProfile -ExecutionPolicy Bypass -File "C:\...\teknisyen\scripts\backup.ps1" -Source "C:\Users\..." -Destination "D:\Backups\User"`
5) Conditions: AC power şartı (laptop için) isteğe bağlı
6) Settings: Run task as soon as possible after a scheduled start is missed

### Doğrulama
- İlk çalıştırmadan sonra `backup.log` ve hedef klasörü kontrol et
- `History` sekmesinde hata olup olmadığını incele


