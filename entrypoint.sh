#!/bin/bash
set -e

chown -R openclaw:openclaw /data
chmod 700 /data

if [ ! -d /data/.linuxbrew ]; then
  cp -a /home/linuxbrew/.linuxbrew /data/.linuxbrew
fi

rm -rf /home/linuxbrew/.linuxbrew
ln -sfn /data/.linuxbrew /home/linuxbrew/.linuxbrew

# Copy workspace skills from repo to runtime workspace
mkdir -p /data/workspace/skills
if [ -d /app/skills ]; then
  cp -rn /app/skills/* /data/workspace/skills/ 2>/dev/null || true
fi

exec gosu openclaw node src/server.js
