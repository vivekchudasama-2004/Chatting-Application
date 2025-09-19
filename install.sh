#!/bin/bash

# Installation and Setup Script for Chatting Application
echo "======================================================"
echo "         Chatting Application Installer"
echo "======================================================"

# Function to check if Java is installed
check_java() {
    if command -v java &> /dev/null; then
        JAVA_VERSION=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
        echo "✓ Java found: $JAVA_VERSION"
        return 0
    else
        echo "✗ Java not found"
        return 1
    fi
}

# Function to check if javac is installed
check_javac() {
    if command -v javac &> /dev/null; then
        echo "✓ Java Compiler (javac) found"
        return 0
    else
        echo "✗ Java Compiler (javac) not found"
        return 1
    fi
}

# Main installation process
echo "Checking prerequisites..."

if ! check_java; then
    echo "Please install Java JRE 11 or higher"
    echo "Ubuntu/Debian: sudo apt install openjdk-11-jre"
    echo "CentOS/RHEL: sudo yum install java-11-openjdk"
    echo "macOS: brew install openjdk@11"
    exit 1
fi

if ! check_javac; then
    echo "Java compiler not found. Installing JDK might be needed for building."
    echo "Ubuntu/Debian: sudo apt install openjdk-11-jdk"
    echo "CentOS/RHEL: sudo yum install java-11-openjdk-devel"
    echo "macOS: brew install openjdk@11"
fi

echo ""
echo "Building the application..."
if ./build.sh; then
    echo ""
    echo "✓ Installation completed successfully!"
    echo ""
    echo "To run the application:"
    echo "  Server: ./run.sh server"
    echo "  Client: ./run.sh client"
    echo ""
    echo "Or use the interactive deployment script:"
    echo "  ./deploy.sh"
    echo ""
    echo "For Docker deployment:"
    echo "  docker-compose up --build"
    echo ""
else
    echo "✗ Build failed. Please check the error messages above."
    exit 1
fi