FROM archlinux:base

RUN pacman -Syu --noconfirm
RUN pacman -S \
    sudo \
    tar \
    git \
    neovim \
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

# Add a function to export config
RUN echo 'export_nvim() { tar -czf /export/nvim.tar.gz -C ~/.config nvim && echo "Config exported to /export/nvim.tar.gz"; }' >> ~/.bashrc

ENV EDITOR=nvim
ENV VISUAL=nvim

# Create export directory and make it a volume
USER root
RUN mkdir /export && chown nvimuser:nvimuser /export
USER nvimuser
VOLUME ["/export"]

CMD ["/bin/bash"]
