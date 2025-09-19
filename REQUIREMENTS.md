# System Requirements

## Minimum Requirements

### Java Runtime Environment
- **Java Version**: Java 11 or higher
- **Memory**: 512 MB RAM minimum
- **Disk Space**: 50 MB free space

### Operating System Support
- **Windows**: Windows 7 or higher
- **macOS**: macOS 10.12 or higher  
- **Linux**: Any modern distribution with GUI support

### GUI Requirements
- **Display**: Any resolution (application window is 450x700 pixels)
- **Graphics**: Basic graphics support for Java Swing
- **Input**: Keyboard and mouse

## Network Requirements

### Local Deployment
- **Ports**: TCP port 2024 (configurable in source code)
- **Network**: Local network access between client and server

### Docker Deployment
- **Docker**: Docker 20.10 or higher
- **Docker Compose**: Version 3.8 support
- **X11**: For Linux GUI applications in Docker

## Installation Notes

### Java Installation Commands

#### Ubuntu/Debian
```bash
sudo apt update
sudo apt install openjdk-11-jdk
```

#### CentOS/RHEL/Fedora
```bash
sudo dnf install java-11-openjdk-devel
# or for older versions:
# sudo yum install java-11-openjdk-devel
```

#### macOS
```bash
brew install openjdk@11
```

#### Windows
Download and install from: https://adoptopenjdk.net/

### Verification
Check your Java installation:
```bash
java -version
javac -version
```

Both commands should show Java 11 or higher.