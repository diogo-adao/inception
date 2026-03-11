# DEV_DOC.md — Developer Documentation

## Environment Setup

**Requirements:** Docker, Docker Compose v2, Make, Git. The project must run inside a Virtual Machine.

The domain must resolve locally. Add the following line to `/etc/hosts` on your VM:
```
127.0.0.1   <your_login>.42.fr
```

**Configuration files:**
- `srcs/.env.example` — template file committed to the repository. Copy it to `srcs/.env` and fill in your credentials before running the project. The `.env` file is gitignored and must never be pushed.
- `srcs/docker-compose.yml` — defines all three services, the Docker network, and the two named volumes.
- Each service has its own `Dockerfile` under `srcs/requirements/<service>/` and a `tools/` folder containing its configuration and entrypoint script:
  - `nginx/tools/` — NGINX site configuration (HTTPS only, port 443, TLSv1.2/1.3)
  - `wordpress/tools/` — `script.sh` (entrypoint) and `www.conf` (php-fpm pool config)
  - `mariadb/tools/` — `script.sh` (entrypoint) and `50-server.cnf` (MariaDB config)

**Note:** HTTP access is disabled. The only entrypoint into the infrastructure is HTTPS on port 443 through the NGINX container.

---

## Build and Launch

```bash
make        # builds all images and starts containers in detached mode
make down   # stops and removes containers and the network
make stop   # stops containers without removing them
make start  # restarts previously stopped containers
make status # lists running containers (docker ps)
```

All credentials are read from `srcs/.env` at startup. If the `.env` file is missing or incomplete, the build will fail or services will misbehave.

**Important:** Once the volumes are initialized, user and database creation only happens on the first run. If you bring the project down with `make down` and back up with `make`, the existing volume data is reused — no new users or databases are created. This is expected behavior.

---

## Managing Containers and Volumes

```bash
# Follow logs for a specific service
docker compose -f srcs/docker-compose.yml logs -f <service>

# Open a shell inside a running container
docker exec -it <service> sh

# List all Docker volumes
docker volume ls

# Inspect a volume
docker volume inspect <volume_name>
```

---

## Data Storage and Persistence

Two Docker named volumes store persistent data on the host VM under `/home/<your_login>/data/`:

| Volume | Contents | Host path |
|---|---|---|
| `wordpress_data` | WordPress site files | `/home/<login>/data/wordpress` |
| `db_data` | MariaDB database files | `/home/<login>/data/mariadb` |

Data persists across `make down` / `make up` cycles. There is no automated clean target for volumes — to fully reset the project state, bring the containers down and manually remove the volumes and host data directories:

```bash
make down
docker volume rm <volume_name>
sudo rm -rf /home/<your_login>/data/
```
