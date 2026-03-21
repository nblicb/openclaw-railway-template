#!/bin/bash
set -e

chown -R openclaw:openclaw /data
chmod 700 /data

if [ ! -d /data/.linuxbrew ]; then
  cp -a /home/linuxbrew/.linuxbrew /data/.linuxbrew
fi

rm -rf /home/linuxbrew/.linuxbrew
ln -sfn /data/.linuxbrew /home/linuxbrew/.linuxbrew

# Sync workspace skills from repo (delete + copy to ensure updates)
mkdir -p /data/workspace/skills
if [ -d /app/skills ]; then
  for skill_dir in /app/skills/*/; do
    skill_name=$(basename "$skill_dir")
    rm -rf "/data/workspace/skills/$skill_name"
    cp -r "$skill_dir" "/data/workspace/skills/$skill_name"
  done
fi

exec gosu openclaw node src/server.js
