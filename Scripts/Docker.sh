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
chown -R 200 ~/nexus-app/docker-nexus-repository/nexus-data
chown -R 200 ~/nexus-app/docker-nexus-repository

docker exec -it nexus-repository /bin/bash

62dddecb-21db-40b5-a824-9abc3587a7ba

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

##############################################
# Example Gitlab
##############################################

sudo docker pull gitlab/gitlab-ce:16.6.1-ce.0

sudo mkdir -p /srv/gitlab/config /srv/gitlab/logs /srv/gitlab/data

sudo docker run --detach \
  --hostname 45.132.50.100 \
  --publish 1096:443 --publish 1095:80 --publish 1097:22 \
  --name gitlab \
  --restart always \
  --volume /srv/gitlab/config:/etc/gitlab \
  --volume /srv/gitlab/logs:/var/log/gitlab \
  --volume /srv/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce:16.6.1-ce.0
