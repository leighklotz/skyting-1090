# ADS-B Exchange – Install

**Goal:** Ship local readsb beast data to ADS-B Exchange (feed + mlat) and upload stats.

## Prerequisites

`readsb` running with beast output on `127.0.0.1:30005`. (`tar1090` on 8080 optional.)

## Steps

### 1. Feed client

```bash
curl -fL -o /tmp/axfeed.sh https://adsbexchange.com
head -1 /tmp/axfeed.sh   # must start with #!/bin/bash, NOT <html
sudo bash /tmp/axfeed.sh
```

Creates:
- `/usr/local/share/adsbexchange/adsbx-uuid` — **copy this UUID**
- systemd units: `adsbexchange-feed.service`, `adsbexchange-mlat.service`
- venv + compiled `feed-adsbx` binary under `/usr/local/share/adsbexchange/`

### 2. Stats

```bash
curl -fL -o /tmp/axstats.sh \
  https://raw.githubusercontent.com/ADSBexchange/adsbexchange-stats/master/stats.sh
sudo bash /tmp/axstats.sh
```

Creates:
- `adsbexchange-stats.service`
- `adsbexchange-showurl` command

### 3. Verify

```bash
systemctl is-active adsbexchange-feed adsbexchange-mlat adsbexchange-stats
adsbexchange-showurl
```

Output should be a URL like:
`https://www.adsbexchange.com/api/feeders/?feed=<UUID>`

Open it; your feed should appear within a few minutes.

## Outputs to keep

| Item | Where |
|------|-------|
| ADS-B UUID | `/usr/local/share/adsbexchange/adsbx-uuid` |
| Feeder URL | `adsbexchange-showurl` |
| Service units | `/usr/lib/systemd/system/adsbexchange-{feed,mlat,stats}.service` |

All services are `enabled` and will restart on boot.
