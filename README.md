# mongo-srv-poc

Local PoC:
- MongoDB replica set (5 nodes) via Docker Compose
- CoreDNS providing SRV/TXT records for mongodb+srv
- Ruby app connects via mongodb+srv and prints server list before/after SRV rescan

## Run

```bash
docker compose up --build --remove-orphans
```

```
❯ docker compose logs -f app patch

app-1  | [Initialing] servers size=3)
app-1  | [After 5s] servers size=5)
patch-1  | [Initialing] servers size=3)
patch-1  | [After 5s] servers size=3)
```