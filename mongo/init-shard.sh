#!/usr/bin/env bash
set -euo pipefail

echo "[init-shard] waiting sh1a..."
until mongosh --quiet --host sh1a.test.local --port 27018 --eval 'db.adminCommand({ping:1}).ok' | grep -q 1; do
  sleep 1
done

echo "[init-shard] initiating shardRS..."
mongosh --host sh1a.test.local --port 27018 /init-shard.js

echo "[init-shard] waiting shardRS PRIMARY..."
until mongosh --quiet --host sh1a.test.local --port 27018 --eval 'rs.isMaster().ismaster' 2>/dev/null | grep -q true; do
  sleep 1
done

echo "[init-shard] done."
