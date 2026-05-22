#!/usr/bin/env bash
set -euo pipefail

URL=http://127.0.0.1:8000/

HTTP_CODE=$(curl \
-s \
-o /dev/null \
-w "%{http_code}" "$URL" || echo "000")

if [[ "$HTTP_CODE" == "200" ]]
then
    echo "HEALTHCHECK OK: Service is up (Code 200)"
else
    echo "HEALTHCHECK FAILED: Service returned $HTTP_CODE"
    exit 1
fi
