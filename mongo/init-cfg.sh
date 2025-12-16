#!/usr/bin/env bash
set -euo pipefail

echo "[init-cfg] waiting cfg1..."
until mongosh --quiet --host cfg1.test.local --port 27019 --eval 'db.adminCommand({ping:1}).ok' | grep -q 1; do
  sleep 1
done

echo "[init-cfg] initiating cfgRS..."
mongosh --host cfg1.test.local --port 27019 /init-cfg.js

echo "[init-cfg] waiting cfgRS PRIMARY..."
until mongosh --quiet --host cfg1.test.local --port 27019 --eval 'rs.isMaster().ismaster' 2>/dev/null | grep -q true; do
  sleep 1
done

echo "[init-cfg] done."
