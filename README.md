# Noapoleon's dotfiles
I like manual configs :]

# Components
 - **Shell**: zsh/[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
 - **Editor**: [neovim](https://github.com/neovim/neovim)
 - **Terminal multiplexer**: [tmux](https://github.com/tmux/tmux)
 - **Font**: [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)

# Todo
### System
- [ ] install arch on spare ssd again
- 

### Repo
- [ ] Better README.md:
    - [ ] formatting
    - [x] add links
    - [ ] images
    - [ ] Install guide

### Install script
- [ ] Add python deps: python3 python3-pip python3-pipenv
- [ ] separate main install script into multiple smaller ones:
    - [x] dependency checker
    - [x] neovim install
    - [x] fonts install
    - [ ] get script absolute path
    - [ ] stow linking
    - [ ] oh-my-zsh install + theme
    - [ ] tmux + plugins install
- [ ] prompt system with `read` in the form of [Y/n] for different components
- [ ] install script options:
    - [ ] backup directory option: ./install --backup=<dir>
    - [x] install neovim locally in .local/bin
    - more error detection and messages
    - copy tmuxifier session layout for coding

### Nvim
- [ ] Investigate alternatives to neo-tree, fuzzy-finder doesn't seem to work
- [ ] Figure out how to handle copy and paste both in ssh and normal terminal (tmux too)

### Tmux
- [ ] Figure out how to handle copy and paste both in ssh and normal terminal (nvim too)

### Zsh
- [ ] Look into zinit and ohmyposh more
- [ ] Can ohmyposh be used with ohmyzsh?
- [ ] ~~Move git branch name to top of prompt bar (or not, idk)~~
- [x] Disable vim mode ~~and configure ctrl+x ctrl+e with VIM not NEOVIM~~
