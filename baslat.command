#!/bin/bash
# ============================================================
#  İlan Analiz — tek tıkla başlat
#  Bu dosyaya çift tıklayın. Tarayıcı otomatik açılır.
# ============================================================
cd "$(dirname "$0")"
PORT=8765

echo "İlan Analiz başlatılıyor…"
echo "Klasör: $(pwd)"

# Gerekirse port doluysa başka port dene
if lsof -iTCP:$PORT -sTCP:LISTEN >/dev/null 2>&1; then
  PORT=8766
fi

# Sunucuyu arka planda başlat
python3 -m http.server "$PORT" >/tmp/ilan-analiz-server.log 2>&1 &
SERVER_PID=$!

sleep 1.2
URL="http://localhost:$PORT"
echo "Adres: $URL"
open "$URL" 2>/dev/null || echo "Tarayıcı otomatik açılmadı, el ile $URL açın."

echo ""
echo "Bu pencere açık kaldıkça uygulama çalışır."
echo "Kapatmak için pencereyi kapatın veya Ctrl+C basın."

wait $SERVER_PID
