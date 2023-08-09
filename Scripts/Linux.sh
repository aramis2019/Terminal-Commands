

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


#Display All Open Network Ports
 netstat -tulpn

 #Display All TCP Sockets
 netstat -nat

 #Display All UDP Sockets
  netstat -nau
