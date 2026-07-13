#!/usr/bin/env sh
set -eu

if [ ! -f .env ]; then
  cp .env.example .env
  echo "Created .env from .env.example. Edit WEBUI_SECRET_KEY before using this beyond a local test."
fi

docker compose up -d
