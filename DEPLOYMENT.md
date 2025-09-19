# Deployment Guide

## Important Notice: This is a Desktop Application

**This Chatting Application is a desktop Java Swing GUI application and cannot be deployed as a web service.** 

### Why This Application Cannot Be Web-Deployed

1. **Java Swing GUI**: The application uses Java Swing for its user interface, which requires a desktop environment
2. **Local Socket Communication**: It uses TCP sockets for local communication between client and server components
3. **Desktop-Only Architecture**: Designed specifically for local machine execution, not web browsers
4. **No Web Interface**: There is no HTML/CSS/JavaScript frontend or web server component

## Available Deployment Options

### 1. Local Desktop Deployment

**Prerequisites:**
- Java 11 or higher
- Desktop environment (Windows, macOS, Linux with GUI)

**Steps:**
```bash
# Clone the repository
git clone https://github.com/vivekchudasama-2004/Chatting-Application.git
cd Chatting-Application

# Build the application
./build.sh

# Run the application
./run.sh server    # Terminal 1: Start server
./run.sh client    # Terminal 2: Start client
```

### 2. Docker Deployment (Local)

**Prerequisites:**
- Docker and Docker Compose
- X11 server (for Linux GUI applications)

**Steps:**
```bash
# For Linux with X11 GUI support
xhost +local:docker
docker-compose up --build

# For headless environments (server only)
docker run -p 2024:2024 chat-app java -jar person2-server.jar
```

### 3. Distributed Deployment

For running client and server on different machines:

**Server Machine:**
```bash
java -jar ChattingApplication/JavaMiniProject/person2-server.jar
```

**Client Machine:**
1. Modify `Person1.java` to change the server IP from `127.0.0.1` to the server's IP address
2. Recompile and run:
```bash
java -jar ChattingApplication/JavaMiniProject/person1-client.jar
```

## Alternative Web-Based Solutions

If you need a web-deployable chat application, consider:

1. **Convert to Web Application**: Rewrite using:
   - Frontend: HTML/CSS/JavaScript, React, Angular, or Vue.js
   - Backend: Node.js, Java Spring Boot, Python Flask/Django
   - WebSockets for real-time communication

2. **Use Existing Web Chat Solutions**: 
   - Socket.io chat applications
   - Firebase real-time chat
   - WebRTC-based solutions

## Network Configuration

**Default Configuration:**
- Server listens on: `127.0.0.1:2024`
- Client connects to: `127.0.0.1:2024`

**To Change Network Settings:**
- Edit `Person1.java`: `Socket s = new Socket("YOUR_SERVER_IP", 2024);`
- Edit `Person2.java`: `ServerSocket skt = new ServerSocket(2024);`
- Recompile with `./build.sh`

## Troubleshooting

### Common Issues
1. **"No deployment link available"**: This is expected - desktop applications don't have web URLs
2. **GUI not showing**: Ensure you have a desktop environment
3. **Connection refused**: Start the server before the client
4. **Port conflicts**: Change the port number in both Java files

### Getting Help
- Check the main [README.md](README.md) for detailed setup instructions
- Review [REQUIREMENTS.md](REQUIREMENTS.md) for system requirements
- Use the interactive deployment script: `./deploy.sh`