FROM openjdk:8

ARG VERSION=1.16.4

EXPOSE 25565

RUN mkdir JARS
RUN mkdir server

RUN apt-get update -y && apt-get install git wget -y

WORKDIR "/JARS"

RUN wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev ${VERSION}

WORKDIR "/server"

ENTRYPOINT [ "java", "-jar", "/JARS/spigot-*.jar" ]