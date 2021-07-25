FROM openjdk:16-alpine

# The version of minecraft you want for your server
ENV MINCRAFT_VERSION="1.17.1" 

# Minecraft server port
EXPOSE 25565

RUN mkdir JARS
RUN mkdir server

# Get basics packages
RUN apk update && apk add git wget nano

# Download the BuildTools.jar from https://hub.spigotmc.org/jenkins/job/BuildTools/
WORKDIR "/JARS"
RUN wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastStableBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev $MINCRAFT_VERSION

# Start the server
WORKDIR "/server"
ENTRYPOINT java -jar /JARS/spigot-$MINCRAFT_VERSION.jar
