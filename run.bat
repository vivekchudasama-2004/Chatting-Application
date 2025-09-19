@echo off
echo Chat Application Runner
echo ======================

if "%1"=="server" (
    echo Starting Chat Server...
    cd ChattingApplication\JavaMiniProject
    java -jar person2-server.jar
) else if "%1"=="client" (
    echo Starting Chat Client...
    cd ChattingApplication\JavaMiniProject
    java -jar person1-client.jar
) else (
    echo Usage: %0 [server^|client]
    echo.
    echo Examples:
    echo   %0 server    # Start the chat server
    echo   %0 client    # Start the chat client
    echo.
    echo Note: Start the server first, then start the client
    pause
)