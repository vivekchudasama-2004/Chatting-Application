# FAQ: Deployment Links

## Q: Where is the deployment link for this project?

**A: This application cannot be deployed with a web link** because it is a **desktop Java Swing GUI application**, not a web application.

### What this means:
- ❌ No web URL available
- ❌ Cannot run in web browsers  
- ❌ No online hosted version possible
- ✅ Runs locally on your computer
- ✅ Requires Java and desktop environment

### How to run this application:

1. **Quick Start:**
   ```bash
   git clone https://github.com/vivekchudasama-2004/Chatting-Application.git
   cd Chatting-Application
   ./build.sh
   ./run.sh server    # Terminal 1
   ./run.sh client    # Terminal 2
   ```

2. **Docker (Local):**
   ```bash
   docker-compose up --build
   ```

### If you need a web-based chat:
Consider using these alternatives:
- Socket.io chat applications
- Firebase real-time chat
- Discord/Slack integrations
- WebRTC-based solutions

### More Information:
- See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed deployment options
- See [README.md](README.md) for complete setup instructions