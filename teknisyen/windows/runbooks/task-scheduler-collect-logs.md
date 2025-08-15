## Task Scheduler ile Log Toplama Zamanlama (collect-logs.ps1)

### Seçenek 1 — Elle Oluşturma
1) Task Scheduler → Create Task
2) General: Run only when user is logged on (basit kurulum), Run with highest privileges
3) Triggers: Daily, 21:00 (örnek)
4) Actions: Start a program → `powershell.exe`
   - Arguments: `-NoProfile -ExecutionPolicy Bypass -File "C:\...\teknisyen\scripts\collect-logs.ps1"`
5) Settings: Run task as soon as possible after a scheduled start is missed

Not: Kullanıcı oturum açmadayken çalışır. Oturum kapalıyken çalıştırmak için ek yapılandırma/kimlik gerekir.

### Seçenek 2 — Script ile Otomatik Kayıt
`teknisyen/scripts/register-collect-logs-task.ps1` çalıştır:

```powershell
powershell -ExecutionPolicy Bypass -File .\teknisyen\scripts\register-collect-logs-task.ps1 -TaskName "CollectLogsDaily" -StartTime "21:00"
```

Script, mevcut kullanıcıyla (InteractiveToken) ve yönetici ayrıcalığıyla çalışacak günlük bir görev oluşturur.


