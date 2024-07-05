# Noapoleon's dotfiles
I like manual configs :]

# Components
 - **Shell**: zsh/[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
 - **Editor**: [neovim](https://github.com/neovim/neovim)
 - **Terminal multiplexer**: [tmux](https://github.com/tmux/tmux)
 - **Font**: [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)

> [!WARNING]
> These dotfiles were made under debian 12, they should work on other distros but haven't been tested for that.

# Todo
### System
- [ ] install arch on spare ssd again

### Repo
- [ ] Better README.md:
    - [ ] formatting
    - [x] add links
    - [ ] images
    - [ ] Install guide
    - [ ] collapsable dependencies section with line that says there's a script to install them
- add terminator config for 42

### Install script
- [ ] check_deps.sh:
    - [x] python3 python3-pip python3-pipenv
    - [x] docker
    - [ ] separate manually installed deps from apt installed
    - [ ] prompt install_xxxxx.sh scripts from check_deps.sh maybe?
    - [ ] figure out how to check libraries like fuse and ripgrep, command name is not the same or smth
- [ ] separate main install script into multiple smaller ones:
    - [x] dependency checker
    - [x] neovim install
    - [x] fonts install
    - [ ] get script absolute path
    - [ ] stow linking
    - [ ] oh-my-zsh install + theme
    - [ ] tmux + plugins install
- [ ] main install script options:
    - [ ] prompt system with `read` in the form of [Y/n] for different components
    - [ ] backup directory option: ./install --backup=<dir>
    - [x] install neovim locally in .local/bin
    - [ ] more error detection and messages
    - [ ] copy tmuxifier session layout for coding
- [ ] install_nvim.sh:
    - [ ] call install_fonts.sh from within maybe?
- [ ] install_python.sh

### Nvim
- [ ] Investigate alternatives to neo-tree, fuzzy-finder doesn't seem to work
- [ ] Figure out how to handle copy and paste both in ssh and normal terminal (tmux too)
- [x] vim-tmux-navigator not working under pipenv shell
- [ ] make pull request for pipenv shell + nvim + tmux issue with vim-tmux-navigator for is_vim regex
- [ ] live_grep telescope change max-depth
- [ ] maybe make noavim fork lol, would need to actually configure it well before that
- [ ] Properly configure python pyright lsp (not working with django rn, giving erros when there is none in the code and dumb warnings)
- [x] toggle tree with <leader>N
- [ ] diagnose nvim very slow on single line file (lsp? treesitter?)
- [ ] file search and livegrep (telescope) not using hidden/dot files for search
- [ ] convenient way to resize nvim split windows
- [ ] look into session manager: [reddit post](https://www.reddit.com/r/neovim/comments/szis80/which_session_manager_for_nvim/)
- [ ] keybind to switch tabs
- [ ] look into buffer switchers

### Tmux
- [ ] Figure out how to handle copy and paste both in ssh and normal terminal (nvim too)
- [ ] convenient way to resize tmux panes

### Zsh
- [ ] Look into zinit and ohmyposh more
- [ ] Can ohmyposh be used with ohmyzsh?
- [ ] Move git branch name to top of prompt bar
- [x] Disable vim mode ~~and configure ctrl+x ctrl+e with VIM not NEOVIM~~
- [ ] bak command:
    - [ ] needs to do `cp` by default
    - [ ] -m option to move instead of copy
    - [ ] bak -u to `undo`, only works on .bak extensions and if there isn't a file of the same future name
- [ ] ZSH theme:
    - [ ] dynamic prompt info that displays more stuff if window is wide enough
    - [ ] start theme from scratch now that i know better how it works
    - [ ] supports:
        - [x] python venv
        - [ ] git branch
        - [ ] git info about commits, updated files, etc.
        - [ ] time (and date maybe?)
        - [ ] username, hostname, tty maybe
        - [ ] unfinished lines e.g: quotations, backslashes, etc.
- [ ] XDG configs:
    - [ ] python history and similar stuff
    - [ ] .npm
    - [ ] .gitconfig
    - [ ] .ssh
    - [ ] .vim and .viminfo (without interfering with nvim)
    - [ ] wget-hsts
    - [ ] .zshenv (change skeleton or whatnot in etc)
- [ ] zshrc alias should prompt to source .zshrc file upon exiting editor with [y/N]
- look into these plugins:
    - [ ] [zsh-navigation-tools](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-navigation-tools)
    - [ ] [vi-mode](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode)
    - [ ] [virtualenv](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/virtualenv)
    - [ ] [vim-interaction](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vim-interaction)
    - [x] [zsh-interactive-cd](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-interactive-cd)

