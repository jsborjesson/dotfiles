# Dotfiles

## Docker

The development environment can be run in isolation in a docker container:

```bash
docker-compose run dotfiles
```

## Local

To install them on your local machine, use GNU Stow:

```
stow -vt ~ git bash tmux
```

## Resources

- [Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
