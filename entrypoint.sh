#!/bin/bash
set -e

chown -R openclaw:openclaw /data
chmod 700 /data

if [ ! -d /data/.linuxbrew ]; then
  cp -a /home/linuxbrew/.linuxbrew /data/.linuxbrew
fi

rm -rf /home/linuxbrew/.linuxbrew
ln -sfn /data/.linuxbrew /home/linuxbrew/.linuxbrew

# Sync workspace skills from repo (overwrite to pick up updates)
mkdir -p /data/workspace/skills
if [ -d /app/skills ]; then
  cp -r /app/skills/* /data/workspace/skills/ 2>/dev/null || true
fi

exec gosu openclaw node src/server.js
