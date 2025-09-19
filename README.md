# Chatting Application

> **⚠️ IMPORTANT NOTICE**: This is a **desktop Java Swing application** that runs locally on your computer. It **cannot be deployed as a web service** and has no web URL. See [NO-WEB-DEPLOYMENT.md](NO-WEB-DEPLOYMENT.md) for details.

Welcome to the Chatting Application! This project is designed to facilitate real-time communication between users using Java Swing GUI and Socket programming. Below is an overview of the application's features, technologies used, and deployment instructions.

## Features

- **Real-Time Messaging**: Users can send and receive messages instantly
- **Dual Client Support**: Two separate interfaces (Person1 and Person2)
- **Socket-based Communication**: Direct TCP socket communication
- **Swing GUI**: User-friendly graphical interface
- **Timestamped Messages**: Each message shows the time it was sent

## Technologies Used

- **Frontend**: Java Swing
- **Backend**: Java Socket Programming
- **Real-Time Communication**: TCP Sockets
- **Build System**: Shell scripts and JAR packaging
- **Deployment**: Docker support included

## Architecture

- **Person2.java**: Acts as the server (listens on port 2024)
- **Person1.java**: Acts as the client (connects to the server)
- Communication uses Java's DataInputStream/DataOutputStream over TCP sockets

## ⚠️ Important: Desktop Application Notice

**This is a desktop Java Swing GUI application that cannot be deployed as a web service.** It requires a local desktop environment to run. For detailed deployment options and alternatives, see [DEPLOYMENT.md](DEPLOYMENT.md).

## Quick Start

### Prerequisites
- Java 11 or higher
- GUI environment (for Swing applications)

### Option 1: Using Pre-built Scripts

1. **Clone and Build**:
   ```bash
   git clone https://github.com/vivekchudasama-2004/Chatting-Application.git
   cd Chatting-Application
   ./build.sh
   ```

2. **Run the Application**:
   ```bash
   # Terminal 1 - Start the server
   ./run.sh server
   
   # Terminal 2 - Start the client
   ./run.sh client
   ```

### Option 2: Manual Compilation

1. **Compile the source code**:
   ```bash
   cd ChattingApplication/JavaMiniProject/src
   javac *.java
   ```

2. **Run the server**:
   ```bash
   java Person2
   ```

3. **Run the client** (in a new terminal):
   ```bash
   java Person1
   ```

### Option 3: Using JAR Files

After building with `./build.sh`:

```bash
# Start server
java -jar ChattingApplication/JavaMiniProject/person2-server.jar

# Start client (in new terminal)
java -jar ChattingApplication/JavaMiniProject/person1-client.jar
```

## Docker Deployment

### Prerequisites
- Docker and Docker Compose

### Steps

1. **Build and run with Docker Compose**:
   ```bash
   docker-compose up --build
   ```

2. **For GUI applications in Docker** (Linux with X11):
   ```bash
   xhost +local:docker
   docker-compose up --build
   ```

### Individual Docker containers:

```bash
# Build the image
docker build -t chat-app .

# Run server
docker run -p 2024:2024 chat-app java -jar person2-server.jar

# Run client
docker run --network host chat-app java -jar person1-client.jar
```

## Usage Instructions

1. **Start the Server First**: Always run Person2 (server) before Person1 (client)
2. **Network Configuration**: The client connects to `127.0.0.1:2024` by default
3. **Multiple Clients**: Currently supports one client connection at a time
4. **GUI Interface**: Both applications provide Swing-based chat windows

## Project Structure

```
Chatting-Application/
├── ChattingApplication/
│   └── JavaMiniProject/
│       ├── src/
│       │   ├── Person1.java       # Chat Client
│       │   └── Person2.java       # Chat Server
│       ├── Icon/                  # UI Icons
│       ├── person1-client.jar     # Built client JAR
│       └── person2-server.jar     # Built server JAR
├── build.sh                       # Build script
├── deploy.sh                      # Deployment script
├── run.sh                         # Simple run script
├── Dockerfile                     # Docker configuration
├── docker-compose.yml             # Docker Compose configuration
├── DEPLOYMENT.md                  # Deployment guide and limitations
├── REQUIREMENTS.md                # System requirements
└── README.md                      # This file
```

## Troubleshooting

### Common Issues

1. **"Connection refused" error**: Make sure the server (Person2) is running first
2. **GUI not showing in Docker**: Ensure X11 forwarding is properly configured
3. **Port already in use**: Change the port number in both Person1.java and Person2.java
4. **Missing icons**: Ensure the Icon directory is in the correct relative path

### Configuration

To change the server IP/port, modify these lines:
- In `Person1.java`: `Socket s = new Socket("127.0.0.1",2024);`
- In `Person2.java`: `ServerSocket skt =new ServerSocket(2024);`

## Development

### Building from Source
```bash
./build.sh
```

### Testing the Application
1. Run the build script
2. Start server and client as described above
3. Type messages in either window and verify they appear in the other

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
   
