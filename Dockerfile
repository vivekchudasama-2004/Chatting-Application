# Use OpenJDK image
FROM openjdk:11-jre-slim

# Install required packages for GUI applications
RUN apt-get update && apt-get install -y \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libxrandr2 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy application files
COPY ChattingApplication/JavaMiniProject/ /app/

# Expose port for server
EXPOSE 2024

# Set display for GUI
ENV DISPLAY=:0

# Default command - can be overridden
CMD ["java", "-jar", "person2-server.jar"]