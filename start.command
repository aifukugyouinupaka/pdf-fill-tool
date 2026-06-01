#!/bin/bash
# 作業完了報告書 記入ツール ローカルサーバ起動
# このファイルをダブルクリックすると、ブラウザでツールが開きます。
cd "$(dirname "$0")" || exit 1
PORT=8765
URL="http://localhost:${PORT}/index.html"

# 既存サーバがあれば再利用、無ければ起動
if ! curl -s --max-time 1 "http://localhost:${PORT}/" >/dev/null 2>&1; then
  echo "サーバを起動します… (Ctrl+C で停止)"
  python3 -m http.server "$PORT" >/dev/null 2>&1 &
  sleep 1
fi

open "$URL"
echo "ブラウザで開きました: ${URL}"
echo "このウィンドウは閉じても構いません（サーバを止める場合はこのウィンドウで Ctrl+C）。"
# サーバをフォアグラウンドに保持
wait
