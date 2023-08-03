brcp proxy
brcp aws login
brcp doctor
brcp credential update

wsl.exe -d wsl-vpnkit --cd /app wsl-vpnkit

# Ubuntu
wsl.exe -d Ubuntu-22.04
cat /etc/resolv.conf | grep nameserver | awk '{ print $2"    host.internal"  }' >> /etc/hosts


# Docker
docker info
docker login --username YOUR_BSG_USERNAME artifacts.devops.bfsaws.net/docker-test-dev
docker run -it python:alpine sh
pip install --upgrade pip