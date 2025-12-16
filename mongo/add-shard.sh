#!/usr/bin/env bash
set -euo pipefail

echo "[add-shard] waiting mongos1..."
until mongosh --quiet --host mongos1.test.local --port 27017 --eval 'db.adminCommand({ping:1}).ok' | grep -q 1; do
  sleep 1
done

echo "[add-shard] adding shard..."
mongosh --host mongos1.test.local --port 27017 /add-shard.js

echo "[add-shard] done."
