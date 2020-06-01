# Dotfiles

## Installation

```
stow -vt ~ git bash tmux
```

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
