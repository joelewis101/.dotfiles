## Joe's dotfiles

Use GNU stow to put symlinks into home directory

For example

```
cd ~/.dotfiles
stow nvim
```

The nvim directory tree in the .dotfiles directory looks like

```
nvim
└── .config
    └── nvim
        ├── coc-settings.json
        └── init.vim
```

Stow looks in the nvim folder, and makes symlink to the contents of that 
folder one folder above where the stow command was run.

vdirsyncer and davmail config files contain secrets - not pushed here
