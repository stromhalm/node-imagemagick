FROM node:24-trixie-slim AS runtime

ARG IMAGEMAGICK_VERSION=7.1.2-36

# Pull in the latest Debian security fixes (incl. Ghostscript CVE-2026-125396)
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y wget autoconf pkg-config

# Add ImageMagick v7 libraries
RUN apt-get update && \
    apt-get install -y build-essential curl libpng-dev gnupg ghostscript && \
    wget https://github.com/ImageMagick/ImageMagick/archive/refs/tags/${IMAGEMAGICK_VERSION}.tar.gz && \
    tar xzf ${IMAGEMAGICK_VERSION}.tar.gz && \
    rm ${IMAGEMAGICK_VERSION}.tar.gz && \
    apt-get clean && \
    apt-get autoremove

RUN sh ./ImageMagick-${IMAGEMAGICK_VERSION}/configure --prefix=/usr/local --with-bzlib=yes --with-fontconfig=yes --with-freetype=yes --with-gslib=yes --with-gvc=yes --with-jpeg=yes --with-jp2=yes --with-png=yes --with-tiff=yes --with-xml=yes --with-gs-font-dir=yes && \
    make -j"$(nproc)" && make install && ldconfig /usr/local/lib/

ENV NODE_ENV=production
WORKDIR /app
