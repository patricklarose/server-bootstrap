#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(sudo vim nano curl wget tree git htop rsync net-tools lm-sensors smartmontools ca-certificates ufw fail2ban)
DOCKER_PACKAGES=(docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin)
ALL_PACKAGES=("${PACKAGES[@]}" "${DOCKER_PACKAGES[@]}")

if [ "$EUID" -ne 0 ]; then
  echo "Run as root."
  exit 1
fi

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y "${PACKAGES[@]}"

# Add Docker's official GPG key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Refresh Apt again to include Docker repo
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y "${DOCKER_PACKAGES[@]}"

echo "Installed: ${ALL_PACKAGES[*]}"
