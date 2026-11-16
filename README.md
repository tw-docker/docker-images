# Container images

Every image has its own package at `ghcr.io/tw-docker/<image>:stable`. The package name matches the directory under `images/`. For example, pull Excalidraw at `ghcr.io/tw-docker/excalidraw-patch:stable`. Builds target Linux on amd64.

Upstream mirrors copy the exact Linux/amd64 manifest and layers. Use the `:stable` tag for each mirror. Tags prefixed with `sha256-` preserve previous upstream builds. Each Dockerfile records the upstream digest. Distinct deployed versions have distinct packages.

Dependabot checks tagged upstream references. A verified digest change on the same tag can merge automatically. Version and tag changes need review. Patched builds pass a smoke test and a Trivy scan before publishing. The initial mirrors preserve the source images as-is. CI scans proposed mirror updates before merging.

## Upstream mirrors

| Mirror | Upstream source | Upstream project license |
| --- | --- | --- |
| [`upstream-adguardhome`](images/upstream-adguardhome/Dockerfile) | [github.com/AdguardTeam/AdGuardHome](<https://github.com/AdguardTeam/AdGuardHome>) | GPL-3.0 |
| [`upstream-dozzle`](images/upstream-dozzle/Dockerfile) | [github.com/amir20/dozzle](<https://github.com/amir20/dozzle>) | MIT |
| [`upstream-open-dronelog`](images/upstream-open-dronelog/Dockerfile) | [github.com/arpanghosh8453/open-dronelog](<https://github.com/arpanghosh8453/open-dronelog>) | AGPL-3.0 |
| [`upstream-ntfy`](images/upstream-ntfy/Dockerfile) | [github.com/binwiederhier/ntfy](<https://github.com/binwiederhier/ntfy>) | Apache-2.0 |
| [`upstream-cloudflared`](images/upstream-cloudflared/Dockerfile) | [github.com/cloudflare/cloudflared](<https://github.com/cloudflare/cloudflared>) | Apache-2.0 |
| [`upstream-eclipse-mosquitto`](images/upstream-eclipse-mosquitto/Dockerfile) | [github.com/eclipse-mosquitto/mosquitto/blob/master/LICENSE.txt](<https://github.com/eclipse-mosquitto/mosquitto/blob/master/LICENSE.txt>) | EPL-2.0 OR BSD-3-Clause |
| [`upstream-keydb-alpine`](images/upstream-keydb-alpine/Dockerfile) | [github.com/Snapchat/KeyDB](<https://github.com/Snapchat/KeyDB>) | BSD-3-Clause |
| [`upstream-keydb-6537505c4235`](images/upstream-keydb-6537505c4235/Dockerfile) | [github.com/Snapchat/KeyDB](<https://github.com/Snapchat/KeyDB>) | BSD-3-Clause |
| [`upstream-forgejo-runner`](images/upstream-forgejo-runner/Dockerfile) | [code.forgejo.org/forgejo/runner](<https://code.forgejo.org/forgejo/runner>) | GPL-3.0 |
| [`upstream-dawarich`](images/upstream-dawarich/Dockerfile) | [github.com/Freika/dawarich](<https://github.com/Freika/dawarich>) | AGPL-3.0 |
| [`upstream-arcane-agent`](images/upstream-arcane-agent/Dockerfile) | [github.com/getarcaneapp/arcane](<https://github.com/getarcaneapp/arcane>) | BSD-3-Clause |
| [`upstream-arcane-manager`](images/upstream-arcane-manager/Dockerfile) | [github.com/getarcaneapp/arcane](<https://github.com/getarcaneapp/arcane>) | BSD-3-Clause |
| [`upstream-gitlab-runner-alpine-v19.5.2`](images/upstream-gitlab-runner-alpine-v19.5.2/Dockerfile) | [github.com/gitlabhq/gitlab-runner](<https://github.com/gitlabhq/gitlab-runner>) | MIT |
| [`upstream-gitlab-runner`](images/upstream-gitlab-runner/Dockerfile) | [github.com/gitlabhq/gitlab-runner](<https://github.com/gitlabhq/gitlab-runner>) | MIT |
| [`upstream-gotify`](images/upstream-gotify/Dockerfile) | [github.com/gotify/server/blob/master/LICENSE](<https://github.com/gotify/server/blob/master/LICENSE>) | MIT |
| [`upstream-grafana`](images/upstream-grafana/Dockerfile) | [github.com/grafana/grafana](<https://github.com/grafana/grafana>) | AGPL-3.0 |
| [`upstream-filebrowser`](images/upstream-filebrowser/Dockerfile) | [github.com/gtsteffaniak/filebrowser](<https://github.com/gtsteffaniak/filebrowser>) | Apache-2.0 |
| [`upstream-beszel`](images/upstream-beszel/Dockerfile) | [github.com/henrygd/beszel](<https://github.com/henrygd/beszel>) | MIT |
| [`upstream-beszel-agent-alpine`](images/upstream-beszel-agent-alpine/Dockerfile) | [github.com/henrygd/beszel](<https://github.com/henrygd/beszel>) | MIT |
| [`upstream-beszel-agent-4100e26f7b5e`](images/upstream-beszel-agent-4100e26f7b5e/Dockerfile) | [github.com/henrygd/beszel](<https://github.com/henrygd/beszel>) | MIT |
| [`upstream-immich-machine-learning`](images/upstream-immich-machine-learning/Dockerfile) | [github.com/immich-app/immich](<https://github.com/immich-app/immich>) | AGPL-3.0 |
| [`upstream-immich-server`](images/upstream-immich-server/Dockerfile) | [github.com/immich-app/immich](<https://github.com/immich-app/immich>) | AGPL-3.0 |
| [`upstream-immich-postgres`](images/upstream-immich-postgres/Dockerfile) | [github.com/immich-app/base-images](<https://github.com/immich-app/base-images>) | AGPL-3.0 |
| [`upstream-influxdb`](images/upstream-influxdb/Dockerfile) | [github.com/influxdata/influxdb](<https://github.com/influxdata/influxdb>) | Apache-2.0 |
| [`upstream-tracktor`](images/upstream-tracktor/Dockerfile) | [github.com/javedh-dev/tracktor](<https://github.com/javedh-dev/tracktor>) | MIT |
| [`upstream-zigbee2mqtt`](images/upstream-zigbee2mqtt/Dockerfile) | [github.com/Koenkk/zigbee2mqtt](<https://github.com/Koenkk/zigbee2mqtt>) | GPL-3.0 |
| [`upstream-speedtest-tracker`](images/upstream-speedtest-tracker/Dockerfile) | [github.com/linuxserver/docker-speedtest-tracker](<https://github.com/linuxserver/docker-speedtest-tracker>) | GPL-3.0 |
| [`upstream-uptime-kuma`](images/upstream-uptime-kuma/Dockerfile) | [github.com/louislam/uptime-kuma](<https://github.com/louislam/uptime-kuma>) | MIT |
| [`upstream-mariadb`](images/upstream-mariadb/Dockerfile) | [github.com/MariaDB/mariadb-docker](<https://github.com/MariaDB/mariadb-docker>) | GPL-2.0 |
| [`upstream-trek`](images/upstream-trek/Dockerfile) | [github.com/mauriceboe/trek](<https://github.com/mauriceboe/trek>) | AGPL-3.0 |
| [`upstream-bambuddy`](images/upstream-bambuddy/Dockerfile) | [github.com/maziggy/bambuddy](<https://github.com/maziggy/bambuddy>) | AGPL-3.0 |
| [`upstream-buildkit`](images/upstream-buildkit/Dockerfile) | [github.com/moby/buildkit](<https://github.com/moby/buildkit>) | Apache-2.0 |
| [`upstream-netbird-dashboard`](images/upstream-netbird-dashboard/Dockerfile) | [github.com/netbirdio/dashboard](<https://github.com/netbirdio/dashboard>) | AGPL-3.0 |
| [`upstream-netbird-server`](images/upstream-netbird-server/Dockerfile) | [github.com/netbirdio/netbird/blob/main/LICENSE](<https://github.com/netbirdio/netbird/blob/main/LICENSE>) | BSD-3-Clause and AGPL-3.0 components |
| [`upstream-zerobyte`](images/upstream-zerobyte/Dockerfile) | [github.com/nicotsx/zerobyte](<https://github.com/nicotsx/zerobyte>) | AGPL-3.0 |
| [`upstream-node`](images/upstream-node/Dockerfile) | [github.com/nodejs/docker-node](<https://github.com/nodejs/docker-node>) | MIT |
| [`upstream-paperless-ngx`](images/upstream-paperless-ngx/Dockerfile) | [github.com/paperless-ngx/paperless-ngx](<https://github.com/paperless-ngx/paperless-ngx>) | GPL-3.0 |
| [`upstream-pgadmin`](images/upstream-pgadmin/Dockerfile) | [github.com/pgadmin-org/pgadmin4/blob/master/LICENSE](<https://github.com/pgadmin-org/pgadmin4/blob/master/LICENSE>) | PostgreSQL |
| [`upstream-postgis`](images/upstream-postgis/Dockerfile) | [github.com/postgis/docker-postgis](<https://github.com/postgis/docker-postgis>) | MIT |
| [`upstream-postgres-16-alpine`](images/upstream-postgres-16-alpine/Dockerfile) | [github.com/docker-library/postgres](<https://github.com/docker-library/postgres>) | MIT |
| [`upstream-postgres-18`](images/upstream-postgres-18/Dockerfile) | [github.com/docker-library/postgres](<https://github.com/docker-library/postgres>) | MIT |
| [`upstream-postgres-18-b9f6b8ff03b6`](images/upstream-postgres-18-b9f6b8ff03b6/Dockerfile) | [github.com/docker-library/postgres](<https://github.com/docker-library/postgres>) | MIT |
| [`upstream-postgres-18-alpine3.24`](images/upstream-postgres-18-alpine3.24/Dockerfile) | [github.com/docker-library/postgres](<https://github.com/docker-library/postgres>) | MIT |
| [`upstream-postgres-18.7-alpine`](images/upstream-postgres-18.7-alpine/Dockerfile) | [github.com/docker-library/postgres](<https://github.com/docker-library/postgres>) | MIT |
| [`upstream-postgres-123b17998cca`](images/upstream-postgres-123b17998cca/Dockerfile) | [github.com/docker-library/postgres](<https://github.com/docker-library/postgres>) | MIT |
| [`upstream-redis-6.2-alpine`](images/upstream-redis-6.2-alpine/Dockerfile) | [github.com/redis/docker-library-redis](<https://github.com/redis/docker-library-redis>) | BSD-3-Clause |
| [`upstream-redis-7-alpine`](images/upstream-redis-7-alpine/Dockerfile) | [github.com/redis/docker-library-redis](<https://github.com/redis/docker-library-redis>) | [RSALv2 or SSPLv1](https://redis.io/legal/licenses/) |
| [`upstream-redis-7.4-alpine`](images/upstream-redis-7.4-alpine/Dockerfile) | [github.com/redis/docker-library-redis](<https://github.com/redis/docker-library-redis>) | [RSALv2 or SSPLv1](https://redis.io/legal/licenses/) |
| [`upstream-redis-8`](images/upstream-redis-8/Dockerfile) | [github.com/redis/docker-library-redis](<https://github.com/redis/docker-library-redis>) | [AGPL-3.0, RSALv2, or SSPLv1](https://redis.io/legal/licenses/) |
| [`upstream-registry`](images/upstream-registry/Dockerfile) | [github.com/distribution/distribution](<https://github.com/distribution/distribution>) | Apache-2.0 |
| [`upstream-registry-82f6ff4a7f98`](images/upstream-registry-82f6ff4a7f98/Dockerfile) | [github.com/distribution/distribution](<https://github.com/distribution/distribution>) | Apache-2.0 |
| [`upstream-rustfs`](images/upstream-rustfs/Dockerfile) | [github.com/rustfs/rustfs](<https://github.com/rustfs/rustfs>) | Apache-2.0 |
| [`upstream-rustfs-1cfa82fb394a`](images/upstream-rustfs-1cfa82fb394a/Dockerfile) | [github.com/rustfs/rustfs](<https://github.com/rustfs/rustfs>) | Apache-2.0 |
| [`upstream-ezswm`](images/upstream-ezswm/Dockerfile) | [github.com/slgfire/ezswm](<https://github.com/slgfire/ezswm>) | GPL-3.0 |
| [`upstream-sonarqube`](images/upstream-sonarqube/Dockerfile) | [github.com/SonarSource/docker-sonarqube](<https://github.com/SonarSource/docker-sonarqube>) | LGPL-3.0 (packaging project) |
| [`upstream-docker-socket-proxy`](images/upstream-docker-socket-proxy/Dockerfile) | [github.com/Tecnativa/docker-socket-proxy](<https://github.com/Tecnativa/docker-socket-proxy>) | Apache-2.0 |
| [`upstream-traefik`](images/upstream-traefik/Dockerfile) | [github.com/traefik/traefik](<https://github.com/traefik/traefik>) | MIT |
| [`upstream-traefik-92627e6a99f7`](images/upstream-traefik-92627e6a99f7/Dockerfile) | [github.com/traefik/traefik](<https://github.com/traefik/traefik>) | MIT |

## Patched images

- [`docker-socket-proxy-legacy-patch`](images/docker-socket-proxy-legacy-patch/Dockerfile) ([upstream source](https://github.com/Tecnativa/docker-socket-proxy))
- [`docker-socket-proxy-patch`](images/docker-socket-proxy-patch/Dockerfile) ([upstream source](https://github.com/Tecnativa/docker-socket-proxy))
- [`excalidraw-patch`](images/excalidraw-patch/Dockerfile) ([upstream source](https://github.com/excalidraw/excalidraw))
- [`forgejo-patch`](images/forgejo-patch/Dockerfile) ([upstream source](https://codeberg.org/forgejo/forgejo))
- [`forgejo-runner-patch`](images/forgejo-runner-patch/Dockerfile) ([upstream source](https://code.forgejo.org/forgejo/runner))
- [`nginx-patch`](images/nginx-patch/Dockerfile) ([upstream source](https://github.com/nginx/docker-nginx))
- [`nodered-patch`](images/nodered-patch/Dockerfile) ([upstream source](https://github.com/node-red/node-red-docker))
- [`samba-patch`](images/samba-patch/Dockerfile) ([upstream source](https://github.com/dperson/samba))
- [`syncthing-patch`](images/syncthing-patch/Dockerfile) ([upstream source](https://github.com/syncthing/syncthing))
- [`zigbee2mqtt-patch`](images/zigbee2mqtt-patch/Dockerfile) ([upstream source](https://github.com/Koenkk/zigbee2mqtt))
