SC STOP Hermitage
SC DELETE Hermitage


rundll32 sysdm.cpl,EditEnvironmentVariables


# dotnet
echo "Windows version"
ver
dotnet --list-runtimes
dotnet --list-sdks
dotnet --version
dotnet --info

net stop was /y 
net start w3svc


netsh interface ipv4 show excludedportrange protocol=tcp
