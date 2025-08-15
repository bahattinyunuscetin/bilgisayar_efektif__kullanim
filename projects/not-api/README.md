## not-api (Node.js + Express + TypeScript)

### Hızlı Başlangıç
```bash
npm install
npm run dev
# http://localhost:3000/health
```

### Örnek İstekler
- `GET /health` → `{ status: "ok" }`
- `GET /notes` → Tüm notlar
- `POST /notes` → `{ title: string, content?: string }`

### Derleme/Çalıştırma
```bash
npm run build && npm start
```


