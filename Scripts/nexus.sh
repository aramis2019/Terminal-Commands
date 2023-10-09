#nexus




docker run -d -p 8081:8081 --name nexus -v ${PWD}/nexus-data:/nexus-data sonatype/nexus3