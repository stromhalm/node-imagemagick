# NodeJS + ImageMagick
This is a simple Docker Image consisting of:

* NodeJS v21
* ImageMagick v7

ImageMagick is already configured to be used within NodeJS, also supporting PDF documents via GhostScript.

## Platform Support
This image supports multiple platforms:
* **linux/amd64** - Intel/AMD 64-bit processors
* **linux/arm64** - ARM 64-bit processors (Apple Silicon M1/M2/M3, AWS Graviton, etc.)

## Installation
To use the latest image, install the pre-built image from the command line:
```
docker pull ghcr.io/stromhalm/node-imagemagick:main
```
Or use it as a base image in your Dockerfile:
```
FROM ghcr.io/stromhalm/node-imagemagick:main
```

Docker will automatically pull the correct image for your platform (Apple Silicon, Intel, etc.).
