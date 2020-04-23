FROM ubuntu:18.04

# Install Docker
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli


# Install packages
RUN apt-get update && apt-get install -y \
    git \
    man \
    neovim \
    stow \
    sudo \
    tmux

# Create Ubuntu user
ARG username=alcesleo
ARG password=docker
RUN useradd ${username} --create-home --shell=/bin/bash --groups=sudo
RUN echo ${username}:${password} | chpasswd
USER ${username}
WORKDIR /home/${username}

# Silence the sudo message at startup
RUN touch .sudo_as_admin_successful

# Link dotfiles
ADD . dotfiles
RUN stow --verbose --dir dotfiles --target ~ \
    git \
    bash
