FROM archlinux:base

RUN pacman -Syu --noconfirm
RUN pacman -S \
    sudo \
    git \
    --noconfirm

RUN useradd -s /bin/bash -m nvimuser

USER nvimuser
WORKDIR /home/nvimuser

RUN mkdir -p ~/.config/nvim

RUN echo 'export PS1="\W > "' >> ~/.bashrc && \
    echo "alias ll='ls -la'" >> ~/.bashrc && \
    echo "alias la='ls -A'" >> ~/.bashrc && \
    echo "alias l='ls -CF'" >> ~/.bashrc && \
    echo "alias vi='nvim'" >> ~/.bashrc && \
    echo "alias vim='nvim'" >> ~/.bashrc

ENV EDITOR=nvim
ENV VISUAL=nvim

CMD ["/bin/bash"]
