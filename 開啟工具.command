#!/bin/bash
cd "$(dirname "$0")"

# 找一個可用的 port
PORT=8888
while lsof -i :$PORT &>/dev/null; do
  PORT=$((PORT + 1))
done

python3 -m http.server $PORT &
SERVER_PID=$!

sleep 0.5

open "http://localhost:$PORT/index.html"

echo "✦ 彩虹數字 × 水晶手鍊工具已啟動"
echo "  網址：http://localhost:$PORT/index.html"
echo ""
echo "  關閉此視窗即停止伺服器"
echo ""

trap "kill $SERVER_PID 2>/dev/null; exit" INT TERM EXIT
wait $SERVER_PID
