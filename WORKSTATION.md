# Open WebUI Workstation

This fork includes a local workstation bundle in `workstation/`.

The bundle runs:

- Open WebUI for chat, memory, knowledge, users, and automations.
- Open WebUI Computer for files, terminal, git, browser tools, persistent sessions, and local agent work.

Start there:

```sh
cd workstation
cp .env.example .env
docker compose up -d
```

Then open:

- Open WebUI: `http://localhost:3000`
- Computer: `http://localhost:8000`

After setup, create a Computer Gateway API key and add it in Open WebUI as an OpenAI-compatible connection with:

```text
http://computer:8000/v1
```

Tailscale can be added later once the local setup works.
