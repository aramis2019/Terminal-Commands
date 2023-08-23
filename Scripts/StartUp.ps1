#Windows proxy
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" | find /i "proxyserver"

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

# VPN https://github.com/sakai135/wsl-vpnkit
wsl.exe -d wsl-vpnkit --cd /app wsl-vpnkit

# Ubuntu
wsl.exe -d Ubuntu-22.04
cat /etc/resolv.conf | grep nameserver | awk '{ print $2"    host.internal"  }' >> /etc/hosts
ping host.internal
ping example.com -i10  -v -D -R -c 2
curl -I https://example.com/
curl -I http://example.com/
sudo wget https://github.com/sakai135/wsl-vpnkit/releases/download/$VERSION/wsl-vpnkit.tar.gz

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
