#!/bin/bash -xe

# Set /data to be root docker folder to enable cache between resin deploys
# for docker running in a systemd system
sed -i 's|docker daemon|docker daemon -g /data|' /lib/systemd/system/docker.service
systemctl daemon-reload
systemctl restart docker

# Start service in detach mode, and clean orphaned containers
docker-compose up -d --remove-orphans

# Remove unused containers
docker rm -v $(docker ps -a -q -f status=exited 2>/dev/null) &>/dev/null || :
docker rmi $(docker images -f "dangling=true" -q 2>/dev/null) &>/dev/null || :
