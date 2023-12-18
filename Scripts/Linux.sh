

# General info

# вывести имя ОС с подробностями
uname -a
hostnamectl

# display Linux distro version
cat /etc/*-release

ping example.com -i10  -v -D -R


# Get IP and Proxy
clear
ip addr
ip r
hostname -I
env | grep proxy
echo "$http_proxy"
echo "$https_proxy"
cat /etc/apt/apt.conf
cat /etc/environment
cat /etc/resolv.conf | grep nameserver | awk '{ print "host ip:" $2 }'

# Ubuntu: Install SHH server
sudo apt update
sudo apt install openssh-server
sudo service ssh status
systemctl status sshd
sudo systemctl start sshd.service
ifconfig

# Ubuntu: Airflow info
source airflow_env/bin/activate
airflow info
airflow plugins

# Ubuntu: Airflow scheduler
source airflow_env/bin/activate
airflow scheduler

# Ubuntu: Airflow scheduler
source airflow_env/bin/activate
airflow webserver


##############################################
# Processes
##############################################
# Processes
htop --user=ec2-user
htop --user=$USER

kill -KILL [process id]


##############################################
# Network
##############################################

#Display All Open Network Ports
 netstat -tulpn

 #Display All TCP Sockets
 netstat -nat

 #Display All UDP Sockets
  netstat -nau

  # Show open Ports
  netstat -tulpn | grep LISTEN

##############################################
#SSH Server on Ubuntu 22
##############################################

sudo service ssh start
sudo service ssh stop
sudo service ssh status
# Generate kays in /home/username/.ssh/id_rsa
ssh-keygen
# Add public key to authorized_keys
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

##############################################
### SSH Keys
##############################################
# проверка стутуса ssh
systemctl status sshd -l

systemctl stop firewalld
systemctl disable firewalld

nano /etc/ssh/sshd_config

##############################################
#Firewall
##############################################

sudo ufw app list
sudo ufw status
sudo ufw COMMAND
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo ufw allow OpenSSH
sudo ufw allow 8081
sudo ufw allow 33500
sudo ufw enable
sudo ufw reload
