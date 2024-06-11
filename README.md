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
    - [ ] more error detection and messages
    - [ ] copy tmuxifier session layout for coding

### Nvim
- [ ] Investigate alternatives to neo-tree, fuzzy-finder doesn't seem to work
- [ ] Figure out how to handle copy and paste both in ssh and normal terminal (tmux too)
- [x] vim-tmux-navigator not working under pipenv shell
- [ ] make pull request for pipenv shell + nvim + tmux issue with vim-tmux-navigator for is_vim regex
- [ ] live_grep telescope change max-depth
- [ ] maybe make noavim fork lol, would need to actually configure it well before that
- [ ] Properly configure python pyright lsp (not working with django rn, giving erros when there is none in the code and dumb warnings)

### Tmux
- [ ] Figure out how to handle copy and paste both in ssh and normal terminal (nvim too)

### Zsh
- [ ] Look into zinit and ohmyposh more
- [ ] Can ohmyposh be used with ohmyzsh?
- [ ] Move git branch name to top of prompt bar
- [x] Disable vim mode ~~and configure ctrl+x ctrl+e with VIM not NEOVIM~~
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
