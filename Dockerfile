FROM alpine:3.19 AS base

RUN apk update && apk add --no-cache \
    neovim \
    vim \
    git \
    curl \
    wget \
    build-base \
    nodejs \
    npm \
    python3 \
    py3-pip \
    ripgrep \
    fd \
    tree-sitter \
    unzip \
    tar \
    gzip \
    which \
    man-db \
    openssh \
    bash \
    sudo \
    shadow && \
    rm -rf /var/cache/apk/*

RUN adduser -D -s /bin/bash nvimuser && \
    echo "nvimuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER nvimuser
WORKDIR /home/nvimuser

RUN mkdir -p ~/.config/nvim

ENV EDITOR=nvim
ENV VISUAL=nvim

CMD ["/bin/bash"]
