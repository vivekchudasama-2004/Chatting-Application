@echo off
echo Building Chatting Application...

cd ChattingApplication\JavaMiniProject\src

echo Compiling Java source files...
javac *.java

if %errorlevel% equ 0 (
    echo Compilation successful!
    echo Creating JAR files...
    
    echo Main-Class: Person1 > person1-manifest.txt
    echo Main-Class: Person2 > person2-manifest.txt
    
    jar cfm ..\person1-client.jar person1-manifest.txt *.class ..\Icon\*
    jar cfm ..\person2-server.jar person2-manifest.txt *.class ..\Icon\*
    
    del person1-manifest.txt person2-manifest.txt
    
    echo JAR files created successfully!
    echo - person1-client.jar (Chat Client)
    echo - person2-server.jar (Chat Server)
) else (
    echo Compilation failed!
    pause
)