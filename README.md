# Dotfiles

## Docker

The development environment can be run in isolation in a docker container:

```bash
docker build -t dotfiles . && docker run -it -v C:\Development:/mnt/development -v /var/run/docker.sock:/var/run/docker.sock dotfiles
```

## Local

To install them on your local machine, use GNU Stow:

```
stow -vt ~ git bash tmux
```

## Resources

- [Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
