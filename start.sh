#!/bin/bash

# Set the amount of memory for the server (adjust based on your system's available memory)
XMX="2G"   # Max RAM (you can adjust this based on your system's available memory)
XMS="1G"   # Initial RAM (set it lower than XMX)

# The name of your EaglerXBungee jar file (make sure this matches the actual jar file name)
JAR_FILE="EaglerXBungee-1.3.4.jar"  # Change to your actual jar file name

# The path to your Java installation (if Java is in your PATH, you can leave this as just 'java')
JAVA_EXEC="java"

# Optional: Enable Garbage Collection (for optimization)
GC_OPTS="-XX:+UseG1GC -XX:+UseStringDeduplication"

# Optional: Enable debug logging
DEBUG_OPTS="-Djava.util.logging.config.file=logging.properties"

# Optional: Enable Java performance flags for server
PERFORMANCE_OPTS="-server -XX:+UnlockExperimentalVMOptions -XX:+AggressiveOpts"

# Check if the jar file exists
if [ ! -f "$JAR_FILE" ]; then
  echo "Error: $JAR_FILE not found!"
  exit 1
fi

# Starting the server
echo "Starting the server with $XMX of memory..."
$JAVA_EXEC $PERFORMANCE_OPTS $GC_OPTS $DEBUG_OPTS -Xmx$XMX -Xms$XMS -jar $JAR_FILE nogui
