https://timeweb.cloud/my/servers/2119933

45.132.50.100
2a03:6f00:4::3791
root password: quy-J82pp@LzYn

combofox.com
45.132.50.100
dev\14all41
root\americanostrichR112

\Storages\YandexDisk\.ssh\ssh_20230808_1gb\

##############################################

root@2119933-cu88699:~# lsb_release -d

Description:    Ubuntu 22.04.3 LTS
root@2119933-cu88699:~# hostnamectl
 Static hostname: 2119933-cu88699.twc1.net
       Icon name: computer-vm
         Chassis: vm
      Machine ID: 3280b97681d8465bbbb8fc51eebc2834
         Boot ID: fe9a835beca147e3ab235890dbb54fde
  Virtualization: kvm
Operating System: Ubuntu 22.04.3 LTS               
          Kernel: Linux 5.15.0-91-generic
    Architecture: x86-64
 Hardware Vendor: QEMU
  Hardware Model: Standard PC _i440FX + PIIX, 1996_

##############################################

root@2119933-cu88699:~# cat /etc/*-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04.3 LTS"
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
##############################################

root@2119933-cu88699:~#  netstat -tulpn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 0.0.0.0:443             0.0.0.0:*               LISTEN      207052/nginx: maste 
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      137439/sshd: /usr/s 
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      207052/nginx: maste 
tcp        0      0 0.0.0.0:1085            0.0.0.0:*               LISTEN      1076/docker-proxy   
tcp        0      0 0.0.0.0:10050           0.0.0.0:*               LISTEN      665/zabbix_agentd   
tcp        0      0 0.0.0.0:8081            0.0.0.0:*               LISTEN      69936/docker-proxy  
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      627/systemd-resolve 
tcp6       0      0 :::443                  :::*                    LISTEN      207052/nginx: maste 
tcp6       0      0 :::22                   :::*                    LISTEN      137439/sshd: /usr/s 
tcp6       0      0 :::80                   :::*                    LISTEN      207052/nginx: maste 
tcp6       0      0 :::1085                 :::*                    LISTEN      1083/docker-proxy   
tcp6       0      0 :::8081                 :::*                    LISTEN      69941/docker-proxy  
udp        0      0 127.0.0.53:53           0.0.0.0:*                           627/systemd-resolve 
udp        0      0 45.132.50.100:68        0.0.0.0:*                           625/systemd-network 

##############################################
## Ports
##############################################

1085 - Gost
8081 - Nexus (https://nexus.combofox.com/)
8111 - Teamcity

##############################################
## Add Teamcity
##############################################

sudo mkdir /srv/teamcity
sudo mkdir -p  /srv/teamcity/logs /srv/teamcity/teamcity_server  /srv/teamcity/teamcity_server/datadir

chown -R 1000:1000
sudo chown -R 1000:1000 /srv/teamcity
sudo chown -R 1000:1000 /srv/teamcity/logs
sudo chown -R 1000:1000 /srv/teamcity/teamcity_server
sudo chown -R 1000:1000 /srv/teamcity/teamcity_server/datadir

docker run --name teamcity-server-instance  \
    -v /srv/teamcity/teamcity_server/datadir:/data/teamcity_server/datadir \
    -v /srv/teamcity/logs:/opt/teamcity/logs  \
    -p 8111:8111 \
    jetbrains/teamcity-server


sudo ufw status
sudo ufw allow 8111

# Please review the settings below before proceeding with the first TeamCity start.
# TeamCity server stores server configuration settings, project definitions, build results and caches on disk in a Data Directory.
# Location of the Data Directory: /data/teamcity_server/datadir