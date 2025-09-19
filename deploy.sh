#!/bin/bash

# Deployment script for Chatting Application
echo "Starting Chat Application Deployment..."

# Check if JAR files exist
if [ ! -f "ChattingApplication/JavaMiniProject/person1-client.jar" ] || [ ! -f "ChattingApplication/JavaMiniProject/person2-server.jar" ]; then
    echo "JAR files not found. Building application first..."
    ./build.sh
fi

echo "Deployment Options:"
echo "1. Start Server (Person2)"
echo "2. Start Client (Person1)"
echo "3. Start Both (Server first, then Client)"
echo "4. Docker Deployment"

read -p "Choose an option [1-4]: " choice

case $choice in
    1)
        echo "Starting Chat Server..."
        cd ChattingApplication/JavaMiniProject
        java -jar person2-server.jar
        ;;
    2)
        echo "Starting Chat Client..."
        cd ChattingApplication/JavaMiniProject
        java -jar person1-client.jar
        ;;
    3)
        echo "Starting Server first..."
        cd ChattingApplication/JavaMiniProject
        gnome-terminal -- bash -c "java -jar person2-server.jar; exec bash" 2>/dev/null || \
        xterm -e "java -jar person2-server.jar" 2>/dev/null || \
        echo "Please start server manually: java -jar person2-server.jar"
        
        sleep 2
        echo "Starting Client..."
        java -jar person1-client.jar
        ;;
    4)
        echo "Starting Docker deployment..."
        if command -v docker &> /dev/null; then
            docker-compose up
        else
            echo "Docker not found. Please install Docker first."
        fi
        ;;
    *)
        echo "Invalid option"
        ;;
esac