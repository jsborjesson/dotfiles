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
    tmux

# Link dotfiles
ADD . /home/dotfiles
RUN stow --verbose --dir /home/dotfiles --target ~ git
