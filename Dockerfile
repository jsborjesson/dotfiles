FROM ubuntu:18.04

# Install packages
RUN apt-get update && apt-get install -y \
    git \
    man \
    neovim \
    stow \
    tmux

# Link dotfiles
ADD . /home/dotfiles
RUN stow --verbose --dir /home/dotfiles --target ~ git
