#!/bin/bash

# Simple run scripts for the chat application
echo "Chat Application Runner"
echo "======================"

if [ "$1" = "server" ]; then
    echo "Starting Chat Server..."
    cd ChattingApplication/JavaMiniProject
    java -jar person2-server.jar
elif [ "$1" = "client" ]; then
    echo "Starting Chat Client..."
    cd ChattingApplication/JavaMiniProject
    java -jar person1-client.jar
else
    echo "Usage: $0 [server|client]"
    echo ""
    echo "Examples:"
    echo "  $0 server    # Start the chat server"
    echo "  $0 client    # Start the chat client"
    echo ""
    echo "Note: Start the server first, then start the client"
fi