#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(sudo vim nano curl wget tree git htop rsync net-tools lm-sensors smartmontools ufw fail2ban)

if [ "$EUID" -ne 0 ]; then
  echo "Run as root."
  exit 1
fi

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y "${PACKAGES[@]}"

echo "Installed: ${PACKAGES[*]}"
