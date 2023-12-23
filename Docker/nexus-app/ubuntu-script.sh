


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