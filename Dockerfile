FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    build-essential \
    gettext \
    git \
    cmake \
    unzip \
    curl \
    openjdk-17-jdk \
    openjdk-17-jre

RUN git clone https://github.com/neovim/neovim.git && \
    cd neovim && \
    make CMAKE_BUILD_TYPE=Release && \
    make install 

RUN git clone https://github.com/aaronhallaert/nvim-tlv.git ~/.config/nvim 
