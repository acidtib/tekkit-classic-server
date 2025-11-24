FROM anapsix/alpine-java

ENV JAVA_ARGS="-Dlog4j.configurationFile=log4j2_server.xml -Xmx2G -Xms1G -XX:MaxPermSize=128m"
ENV SERVER_OP=""

RUN apk add unzip
RUN apk add wget

WORKDIR /minecraft
RUN wget -O /tmp/tekkit.zip https://servers.technicpack.net/Technic/servers/tekkit-legends/Tekkit_Legends_Server_v1.1.1.zip
RUN unzip /tmp/tekkit.zip -d /minecraft/

ADD ./entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

# Create EULA acceptance
RUN echo "eula=true" > eula.txt

EXPOSE 25565

ENTRYPOINT ["/minecraft/entrypoint.sh"]
