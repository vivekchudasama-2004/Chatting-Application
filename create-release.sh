#!/bin/bash

# Create a release package
echo "Creating release package..."

VERSION="v1.0.0"
PACKAGE_NAME="chatting-app-${VERSION}"

# Create release directory
mkdir -p dist/$PACKAGE_NAME

# Copy necessary files
cp -r ChattingApplication dist/$PACKAGE_NAME/
cp *.sh dist/$PACKAGE_NAME/
cp *.bat dist/$PACKAGE_NAME/
cp README.md dist/$PACKAGE_NAME/
cp Dockerfile dist/$PACKAGE_NAME/
cp docker-compose.yml dist/$PACKAGE_NAME/

# Create archive
cd dist
tar -czf ${PACKAGE_NAME}.tar.gz $PACKAGE_NAME
zip -r ${PACKAGE_NAME}.zip $PACKAGE_NAME

echo "Release package created:"
echo "- dist/${PACKAGE_NAME}.tar.gz"
echo "- dist/${PACKAGE_NAME}.zip"