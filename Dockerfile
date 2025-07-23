FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    neovim \
    git \
    curl \
    wget \
    base-devel \
    nodejs \
    npm \
    python \
    python-pip \
    ripgrep \
    fd \
    tree-sitter \
    unzip \
    tar \
    gzip \
    which \
    man-db \
    openssh

RUN useradd -m -s /bin/bash nvimuser && \
    echo "nvimuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER nvimuser
WORKDIR /home/nvimuser

RUN mkdir -p ~/.config/nvim

ENV EDITOR=nvim
ENV VISUAL=nvim

CMD ["/bin/bash"]
