docker stop 53098ec621a9
docker kill 53098ec621a9

docker container prune

sudo systemctl status docker
sudo systemctl enable docker
sudo usermod -aG docker $USER && newgrp docker

# Starting Docker-Engine on boot
sudo systemctl enable /usr/lib/systemd/system/docker.service

sudo systemctl start docker
sudo service docker restart

docker container prune
docker logs -f [CONTAINER NAME]


docker build ./add-apt-packages -t dmitryprotasov769/airflow:2.6.3-python3.10-broadridge2.0

docker inspect nexus-repository

##############################################
#Configure Docker to use a proxy server. https://docs.docker.com/network/proxy/#:~:text=Configure%20proxy%20settings%20per%20daemon,instead%20of%20the%20default%20key.
##############################################

~/.docker/config.json

{
 "proxies": {
   "default": {
     "httpProxy": "host.internal:3128",
     "httpsProxy": "host.internal:3128",
     "noProxy": "localhost,127.0.0.0/8"
   }
 }
}


##############################################
#docker-compose
##############################################

docker compose --profile flower up -d

docker-compose up -d
docker-compose down

docker volume ls
docker inspect time-app_mysql_data

##############################################
# Volumes
# https://docs.docker.com/compose/compose-file/07-volumes/
##############################################

docker volume ls
docker inspect [volume name]

##############################################
# Example Nexus
##############################################

mkdir ~/nexus-app/docker-nexus-repository
mkdir ~/nexus-app/docker-nexus-repository/nexus-data
chown -R 200 ~/nexus-app/docker-nexus-repository/nexus-data
chown -R 200 ~/nexus-app/docker-nexus-repository

docker exec -it nexus-repository /bin/bash

docker run -d -it -p 8081:8081 --name nexus  -v nexus-data:/nexus-data sonatype/nexus3
docker run -d -p 8081:8081 --name nexus -e INSTALL4J_ADD_VM_PARAMS="-Xms2703m -Xmx2703m  -XX:MaxDirectMemorySize=2703m -Djava.util.prefs.userRoot=/some-other-dir" sonatype/nexus3
docker run -d -it -p 8081:8081 --name nexus -e INSTALL4J_ADD_VM_PARAMS="-Xms1000m -Xmx1000m -XX:MaxDirectMemorySize=1000m Djava.util.prefs.userRoot=nexus-data-javaprefs" sonatype/nexus3
docker run -d -it -p 8081:8081 --name nexus -e INSTALL4J_ADD_VM_PARAMS="-Xms1000m -Xmx1000m -XX:MaxDirectMemorySize=1000m Djava.util.prefs.userRoot=${NEXUS_DATA}/javaprefs" sonatype/nexus3
docker run -d -it -p 8081:8081 --name nexus -e INSTALL4J_ADD_VM_PARAMS="-Xms1000m -Xmx1000m -XX:MaxDirectMemorySize=1000m Djava.util.prefs.userRoot=nexus-data/javaprefs" sonatype/nexus3
docker run -it -p 8081:8081 --name nexus -v ~/nexus-app/docker-nexus-repository:/sonatype-work -e INSTALL4J_ADD_VM_PARAMS="-Xms1000m -Xmx1000m -XX:MaxDirectMemorySize=1000m" sonatype/nexus
docker run -it -p 8081:8081 --name nexus-repository -v /home/development/nexus-app/nexus-data:/sonatype-work -e INSTALL4J_ADD_VM_PARAMS="-Xms1000m -Xmx1000m -XX:MaxDirectMemorySize=1024m -Djava.util.prefs.userRoot=/nexus-data/javaprefs" sonatype/nexus3
docker run -it -p 8081:8081 --name nexus-repository -v /home/development/nexus-app/nexus-data:/sonatype-work -e INSTALL4J_ADD_VM_PARAMS="-Xms1000m -Xmx1000m -XX:MaxDirectMemorySize=1024m" sonatype/nexus3
docker run -it -p 8081:8081 --name nexus -v /home/development/nexus-app/docker-nexus-repository:/nexus-data sonatype/nexus3


cd /home/development/nexus-app
 

docker exec -it nexus-repository /bin/bash
cat nexus-data/admin.password

docker logs -f nexus-repository
