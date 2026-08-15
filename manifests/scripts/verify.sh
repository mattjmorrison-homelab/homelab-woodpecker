#!/bin/sh
set -eu

apk add --no-cache curl >/dev/null

URL="https://woodpecker.morrisons.site/healthz"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$STATUS" != "204" ]; then
  echo "FAIL: expected status 204 from $URL, got $STATUS"
  exit 1
fi

echo "PASS: $URL returned 204"
