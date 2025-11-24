FROM anapsix/alpine-java

ENV SERVER_OP=""

RUN apk add unzip wget

WORKDIR /tekkit

RUN wget -O /tmp/tekkit.zip https://servers.technicpack.net/Technic/servers/tekkit-legends/Tekkit_Legends_Server_v1.1.1.zip
RUN unzip /tmp/tekkit.zip -d /tekkit/

COPY ./entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

# Create EULA acceptance
RUN echo "eula=true" > eula.txt

EXPOSE 25565

ENTRYPOINT ["/tekkit/entrypoint.sh"]
