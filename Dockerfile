FROM node:21

# Use production node environment by default.
ENV NODE_ENV production

WORKDIR /usr/src/app

# Add ImageMagick v7 libraries - optimized for multi-platform builds (AMD64 and ARM64)
RUN apt-get update && \
    apt-get install -y \
    wget \
    autoconf \
    pkg-config \
    build-essential \
    curl \
    libpng-dev \
    gnupg \
    ghostscript \
    libbz2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libjpeg-dev \
    libtiff-dev \
    libxml2-dev && \
    wget https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-31.tar.gz && \
    tar xzf 7.1.0-31.tar.gz && \
    rm 7.1.0-31.tar.gz && \
    cd ImageMagick-7.1.0-31 && \
    ./configure --prefix=/usr/local \
        --with-bzlib=yes \
        --with-fontconfig=yes \
        --with-freetype=yes \
        --with-gslib=yes \
        --with-gvc=yes \
        --with-jpeg=yes \
        --with-jp2=yes \
        --with-png=yes \
        --with-tiff=yes \
        --with-xml=yes \
        --with-gs-font-dir=yes && \
    make -j$(nproc) && \
    make install && \
    ldconfig /usr/local/lib/ && \
    cd .. && \
    rm -rf ImageMagick-7.1.0-31 && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
