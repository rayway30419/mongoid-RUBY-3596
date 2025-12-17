# mongoid-RUBY-3596

This repository contains a **local, reproducible proof-of-concept** demonstrating
an issue https://jira.mongodb.org/browse/RUBY-3596 with `srvMaxHosts` when using `mongodb+srv` in the MongoDB Ruby ecosystem.

## Overview

The PoC environment consists of:

- A MongoDB **sharded cluster** (mongos + shard replica set) running via Docker Compose
- **CoreDNS** serving SRV and TXT records required for `mongodb+srv`
- A Ruby application that connects using `mongodb+srv` and prints the server list:
  - immediately after initialization
  - after a subsequent SRV topology rescan

Two variants are provided:
- `app` – reproduces the issue
- `patch` – demonstrates the expected behavior after applying a fix

## How to Run

```bash
docker compose up --build --remove-orphans
