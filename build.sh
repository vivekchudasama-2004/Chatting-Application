#!/bin/bash

# Build script for Chatting Application
echo "Building Chatting Application..."

# Navigate to source directory
cd ChattingApplication/JavaMiniProject/src

# Clean previous builds
rm -f *.class

# Compile Java files
echo "Compiling Java source files..."
javac *.java

if [ $? -eq 0 ]; then
    echo "Compilation successful!"
    
    # Create JAR files
    echo "Creating JAR files..."
    
    # Create manifest files
    cat > person1-manifest.txt << EOF
Main-Class: Person1
EOF
    
    cat > person2-manifest.txt << EOF
Main-Class: Person2
EOF
    
    # Create JAR files with dependencies
    jar cfm ../person1-client.jar person1-manifest.txt *.class ../Icon/*
    jar cfm ../person2-server.jar person2-manifest.txt *.class ../Icon/*
    
    # Clean up manifest files
    rm person1-manifest.txt person2-manifest.txt
    
    echo "JAR files created successfully!"
    echo "- person1-client.jar (Chat Client)"
    echo "- person2-server.jar (Chat Server)"
    
else
    echo "Compilation failed!"
    exit 1
fi