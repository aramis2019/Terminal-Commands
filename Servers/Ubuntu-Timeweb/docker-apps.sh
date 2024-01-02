

##############################################
# Docker nexus
##############################################

admin\adminV12345
dev\americanDev1


docker run -d -it -p 8081:8081 --name nexus  -v nexus-data:/nexus-data sonatype/nexus3
docker run -d -p 8081:8081 --name nexus -e INSTALL4J_ADD_VM_PARAMS="-Xms2703m -Xmx2703m  -XX:MaxDirectMemorySize=2703m -Djava.util.prefs.userRoot=/some-other-dir" sonatype/nexus3
docker run -d -it -p 8081:8081 --name nexus -e INSTALL4J_ADD_VM_PARAMS="-Xms1000m -Xmx1000m -XX:MaxDirectMemorySize=1000m Djava.util.prefs.userRoot=nexus-data-javaprefs" sonatype/nexus3
docker run -d -it -p 8081:8081 --name nexus -e INSTALL4J_ADD_VM_PARAMS="-Xms1000m -Xmx1000m -XX:MaxDirectMemorySize=1000m Djava.util.prefs.userRoot=${NEXUS_DATA}/javaprefs" sonatype/nexus3
docker run -d -it -p 8081:8081 --name nexus -e INSTALL4J_ADD_VM_PARAMS="-Xms1000m -Xmx1000m -XX:MaxDirectMemorySize=1000m Djava.util.prefs.userRoot=nexus-data/javaprefs" sonatype/nexus3
docker run -it -p 8081:8081 --name nexus -v ~/nexus-app/docker-nexus-repository:/sonatype-work -e INSTALL4J_ADD_VM_PARAMS="-Xms1000m -Xmx1000m -XX:MaxDirectMemorySize=1000m" sonatype/nexus
docker run -it -p 8081:8081 --name nexus-repository -v /home/development/nexus-app/nexus-data:/sonatype-work -e INSTALL4J_ADD_VM_PARAMS="-Xms1000m -Xmx1000m -XX:MaxDirectMemorySize=1024m -Djava.util.prefs.userRoot=/nexus-data/javaprefs" sonatype/nexus3
docker run -it -p 8081:8081 --name nexus-repository -v /home/development/nexus-app/nexus-data:/sonatype-work -e INSTALL4J_ADD_VM_PARAMS="-Xms1000m -Xmx1000m -XX:MaxDirectMemorySize=1024m" sonatype/nexus3
docker run -it -p 8081:8081 --name nexus -v /home/development/nexus-app/docker-nexus-repository:/nexus-data sonatype/nexus3

#######################################

su dev

docker pull sonatype/nexus3:3.63.0

mkdir ~/nexus-app
mkdir ~/nexus-app/nexus-data
sudo chown -R 200 ~/nexus-app
sudo chown -R 200 ~/nexus-app/nexus-data

cd /home/development/nexus-app
docker exec -it nexus-repository /bin/bash
cat nexus-data/admin.password
docker logs -f nexus-repository

##############################################
# Docker Example Gitlab
# https://docs.gitlab.com/ee/install/docker.html
##############################################

http://localhost:1095/
root\americanG1
root\americanostrichL11

export GITLAB_HOME=/srv/gitlab

sudo docker run --detach \
  --hostname gitlab.combofox.com \
  --publish 1096:443 --publish 1095:80 --publish 1097:22 \
  --name gitlab \
  --restart always \
  --volume /srv/gitlab/config:/etc/gitlab \
  --volume /srv/gitlab/logs:/var/log/gitlab \
  --volume /srv/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce:16.6.1-ce.0


sudo nano /srv/gitlab/config/gitlab.rb

sudo docker exec -it gitlab bash

#############

Install GitLab Runner
https://docs.gitlab.com/runner/install/docker.html

# Download the binary for your system
sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64

# Give it permission to execute
sudo chmod +x /usr/local/bin/gitlab-runner

# Create a GitLab Runner user
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

# Install and run as a service
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
sudo gitlab-runner start

  gitlab-runner register  --url http://gitlab.combofox.com  --token glrt-iChuH5MAgCaLwysKnGQZ

docker exec -it gitlab-runner gitlab-runner register --url "http://gitlab.combofox.com"  --token glrt-oJkHNQoWBzWJ3JBjKHZ1


##############################################
## Docker Example Teamcity
##############################################

admin\adminV12345
2023487727026817487
6241628178521433684
1392549750130275029

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
