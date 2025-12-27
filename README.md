# Docker Minecraft Server Guide

This repository contains the required Dockerfile and configuration files to build and run a Dockerized Minecraft server.

The setup:
- Uses a fully custom base image (no pre-built Minecraft images)
- Runs the official Mojang Minecraft server JAR
- Allows binding a host directory to persist world data and configurations
- Automatically generates the world and server configuration files on first startup

---

## Requirements

- Docker
- Internet connection

---

## Setting Up the Server

1. Clone the repository and move into the Docker directory:
    ```
    git clone <repository-url>  
    cd dockerFiles  
    ```
2. Build the Docker image (named "minecraft-server-img" in this example):
    ```
    docker build -t minecraft-server-img .  
    ```
3. Run the container and bind a host directory to /minecraft (change "/path/on/host" with the desired file location):
    ```
    docker run -it -p 25565:25565 --restart unless-stopped --name minecraft-server -v /path/on/host:/minecraft minecraft-server-img:latest  
    ```
---

## Managing the Server

### Stopping the server:

1. From inside the Minecraft console:  
    ```
    stop  
    ```
2. From the host system:  
    ```
    docker stop minecraft-server  
    ```

### Starting and Attaching to the Server (accessing Minecraft server console)

Start and attach immediately:
```
docker start -ai minecraft-server  
```
Attach to an already running container:
```
docker attach minecraft-server  
```
Detach without stopping the server: `CTRL + P, CTRL + Q`

---

## Persisted Data

All server data is stored inside the bind-mounted directory on the host.
All configuration files can be edited directly from the host using a text editor or tools such as WinSCP.

---

## License

This project is provided for educational and personal use.  
Minecraft is a trademark of Mojang Studios.
