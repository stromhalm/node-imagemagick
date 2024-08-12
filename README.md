# NodeJS + ImageMagick
This is a simple Docker Image consisting of:

* NodeJS v21
* ImageMagick v7

ImageMagick is already configured to be used within NodeJS, also supporting PDF documents via GhostScript.

## Installation
To use the latest image, install the pre-build image from the command line
```
docker pull ghcr.io/stromhalm/node-imagemagick:main
```
Or use it as a base image in your Dockerfile:
```
FROM ghcr.io/stromhalm/node-imagemagick:main
```
