#!/bin/bash
set -e

DATA_DIR="/minecraft"
BIN_DIR="/opt/minecraft"

cd "$DATA_DIR"

# EULA
if [ ! -f eula.txt ]; then
    echo "eula=true" > eula.txt
fi

echo "Starting Minecraft server..."

if [ ! -d world ] || [ -z "$(ls -A world 2>/dev/null)" ]; then
    echo "Empty volume: creating a new Minecraft server..."
else
    echo "Using existing volume!"
fi

exec java -Xms1024M -Xmx2048M -jar "$BIN_DIR/server.jar" nogui
