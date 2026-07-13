# Setup Checklist

## Local First

- [ ] Docker Desktop is installed and running.
- [ ] `.env` exists and has a unique `WEBUI_SECRET_KEY`.
- [ ] `docker compose up -d` starts both services.
- [ ] Open WebUI loads at `http://localhost:3000`.
- [ ] Computer loads at `http://localhost:8000`.
- [ ] The Computer workspace opens `./workspace`.

## Agent Connection

- [ ] Computer has at least one model or coding-agent backend configured.
- [ ] Computer Gateway API key has been created.
- [ ] Open WebUI has a connection to `http://computer:8000/v1`.
- [ ] The custom Open WebUI headers are configured.
- [ ] A `cptr/<workspace-name>` model appears in Open WebUI.
- [ ] A test prompt can read or create a file in `workspace/notes`.

## Safety

- [ ] Computer is not exposed to the public internet.
- [ ] Admin passwords are strong and saved.
- [ ] No secrets are stored in `workspace/inbox` or committed to git.
- [ ] Backups cover Open WebUI data and Computer data volumes.

## Remote Access Later

- [ ] Tailscale is installed on the workstation.
- [ ] Tailscale is installed on the laptop/phone.
- [ ] Open WebUI works at `http://<tailscale-ip>:3000`.
- [ ] Computer works at `http://<tailscale-ip>:8000`.
- [ ] Remote access is tested before relying on it away from home.
