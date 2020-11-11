FROM openjdk:8

ARG VERSION=1.16.4

EXPOSE 25565

RUN apt-get update -y && apt-get install git wget -y

RUN wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev ${VERSION}

RUN mkdir server
RUN mv spigot-${VERSION}.jar server/

WORKDIR "/server"

RUN java -jar spigot-${VERSION}.jar

RUN sed s/false/true/ eula.txt > temp
RUN rm eula.txt
RUN mv temp eula.txt

ENTRYPOINT [ "java", "-jar", "spigot-1.16.4.jar" ]