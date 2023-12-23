wsl-commands.ps1

ver -версия Windows

wsl --list --online

wsl --update
wsl --status

#List installed Linux distributions:
wsl --list --verbose

Set WSL version to 1 or 2:
wsl --set-version <distribution name> <versionNumber>
wsl --set-version Ubuntu-20.04 2

Set default WSL version:
wsl --set-default-version <Version>

Set default Linux distribution:
wsl --set-default <Distribution Name>

wsl --unregister Debian
wsl --unregister Ubuntu20.04LTS


wsl -t Ubuntu-22.04
wsl --shutdown

wsl.exe -d Ubuntu-22.04
wsl.exe -d wsl-vpnkit --cd /app wsl-vpnkit


# How to check your available disk space
wsl.exe --system -d <distribution-name> df -h /mnt/wslg/distro



##############################################
### SSH Keys
##############################################
# https://devblogs.microsoft.com/commandline/sharing-ssh-keys-between-windows-and-wsl-2/

# Copy keys to  c:\Users\<username>\.ssh

cp -r /mnt/c/Users/<username>/.ssh ~/.ssh
chmod 600 ~/.ssh/id_rsa




##############################################
### Ubuntu-22.04
##############################################



