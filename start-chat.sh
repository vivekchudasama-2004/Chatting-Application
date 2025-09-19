#!/bin/bash

# Start both server and client for the chat application
echo "Starting Chatting Application..."
echo "================================"

# Check if JAR files exist
if [ ! -f "ChattingApplication/JavaMiniProject/person2-server.jar" ]; then
    echo "Server JAR not found. Building application..."
    ./build.sh
    if [ $? -ne 0 ]; then
        echo "Build failed. Exiting."
        exit 1
    fi
fi

echo "Starting server in background..."
cd ChattingApplication/JavaMiniProject

# Start server in background and capture its PID
java -jar person2-server.jar &
SERVER_PID=$!

echo "Server started with PID: $SERVER_PID"
echo "Waiting 3 seconds for server to initialize..."
sleep 3

echo "Starting client..."
java -jar person1-client.jar

# When client closes, kill the server
echo "Client closed. Stopping server..."
kill $SERVER_PID 2>/dev/null

echo "Application stopped."