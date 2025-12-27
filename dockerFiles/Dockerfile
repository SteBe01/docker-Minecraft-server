FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/minecraft

RUN apt-get update && apt-get install -y \
    openjdk-21-jdk \
    wget \
    bash \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O server.jar \
    https://piston-data.mojang.com/v1/objects/64bb6d763bed0a9f1d632ec347938594144943ed/server.jar

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 25565

ENTRYPOINT ["/entrypoint.sh"]
