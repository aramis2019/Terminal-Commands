#WSL
wsl.exe --status
wsl --list --online
wsl.exe --list --verbose
wsl.exe -d Ubuntu-22.04
su -l dima

# brcp proxy
brcp proxy
brcp aws login
brcp doctor
brcp credential update

# VPN
wsl.exe -d wsl-vpnkit --cd /app wsl-vpnkit

# Ubuntu
wsl.exe -d Ubuntu-22.04
cat /etc/resolv.conf | grep nameserver | awk '{ print $2"    host.internal"  }' >> /etc/hosts
curl -I https://example.com/
curl -I http://example.com/

# Docker
docker --version 
docker-compose --version  
docker info
docker login --username protasovd artifacts.devops.bfsaws.net/docker-test-dev

docker run -it python:alpine sh
pip install --upgrade pip

# dotnet
echo "Windows version"
ver 
dotnet --list-runtimes
dotnet --list-sdks
dotnet --version
dotnet --info
