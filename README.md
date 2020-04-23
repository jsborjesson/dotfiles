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

## Troubleshooting

    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Permissions 0777 for '/root/.ssh/id_rsa' are too open.
    It is required that your private key files are NOT accessible by others.
    This private key will be ignored.
    Load key "/root/.ssh/id_rsa": bad permissions
    git@github.com: Permission denied (publickey).
    fatal: Could not read from remote repository.

    Please make sure you have the correct access rights
    and the repository exists.

This often happens after copying the key or when running on Windows which doesn't respect the Linux file
permissions. Set more restricted permissions to the key: `chmod 600 /root/.ssh/id_rsa`.
