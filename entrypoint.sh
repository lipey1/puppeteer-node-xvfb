#!/bin/bash
set -e

cd /home/container

# IP interno, se você quiser usar na app
export INTERNAL_IP=$(ip route get 1 | awk '{print $NF;exit}')

# Mostra versão do Node para debug
node -v

# STARTUP vem do Pterodactyl (template + COMMAND da egg)
MODIFIED_STARTUP=$(echo -e "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

eval "${MODIFIED_STARTUP}"
