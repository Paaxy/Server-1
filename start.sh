
# start.sh
#!/bin/bash

# Start script for EaglercraftXBungee server

# Define the paths
BUNGEE_JAR="EaglerXBungee-Latest.jar"
JAVA_CMD="java"
MIN_HEAP="512M"
MAX_HEAP="1024M"

# Check if the JAR file exists
if [[ ! -f "$BUNGEE_JAR" ]]; then
    echo "Error: $BUNGEE_JAR not found! Make sure it is in the current directory."
    exit 1
fi

# Start the server
echo "Starting EaglercraftXBungee Server..."
$JAVA_CMD -Xms$MIN_HEAP -Xmx$MAX_HEAP -jar $BUNGEE_JAR nogui

# Wait for termination
echo "Server stopped."
