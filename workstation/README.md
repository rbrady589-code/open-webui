# Open WebUI Workstation

This kit turns one machine into the shared workstation:

- Open WebUI at `http://localhost:3000` for chat, memory, agents, RAG, notes, and automations.
- Open WebUI Computer at `http://localhost:8000` for files, terminal, git, browser tools, persistent sessions, and real workspace access.
- A shared local folder at `./workspace` mounted into Computer as `/workspace`.

## Start

1. Copy the environment template:

   ```sh
   cp .env.example .env
   ```

2. Edit `.env` and replace `WEBUI_SECRET_KEY`.

3. Start the stack:

   ```sh
   docker compose up -d
   ```

4. Open:

   - Open WebUI: `http://localhost:3000`
   - Computer: `http://localhost:8000`

Computer usually prints a one-time setup URL with a token in its logs. If the browser asks for a token, read it with:

```sh
docker logs openwebui-computer
```

## Connect Computer Into Open WebUI

After both apps are running:

1. In Computer, open `Settings -> Admin -> Gateway`.
2. Create a gateway API key and copy it immediately.
3. In Open WebUI, open `Admin Settings -> Connections`.
4. Add an OpenAI-compatible connection:

   - Base URL: `http://computer:8000/v1`
   - API key: the `sk-cptr-...` key from Computer

5. Add these custom headers:

   ```json
   {
     "X-OpenWebUI-Chat-Id": "{{CHAT_ID}}",
     "X-OpenWebUI-Message-Id": "{{MESSAGE_ID}}",
     "X-OpenWebUI-User-Message-Id": "{{USER_MESSAGE_ID}}",
     "X-OpenWebUI-User-Message-Parent-Id": "{{USER_MESSAGE_PARENT_ID}}",
     "X-OpenWebUI-Task": "{{TASK}}"
   }
   ```

Computer workspaces should then appear in Open WebUI as models named like `cptr/<workspace-name>`.

## Workspace Layout

The shared folder is intentionally plain:

- `workspace/projects`: active repos and builds.
- `workspace/inbox`: files dropped in from other devices.
- `workspace/outputs`: generated deliverables.
- `workspace/memory`: exported notes, memory snapshots, and long-term context.
- `workspace/notes`: working notes and plans.
- `workspace/automation`: recurring task notes, scripts, and run logs.

## Tailscale Later

Once this is working locally, install Tailscale on the workstation and your laptop/phone. Keep the same ports:

- Open WebUI: `http://<tailscale-ip>:3000`
- Computer: `http://<tailscale-ip>:8000`

Do not expose Computer directly to the public internet. Treat it like SSH: anyone with access can operate the machine.

## Update

```sh
docker compose pull
docker compose up -d
```

## Stop

```sh
docker compose down
```
