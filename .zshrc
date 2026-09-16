export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

export PATH=$HOME/.config/rofi/scripts:$PATH

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="/usr/bin:$PATH"

export PATH="$PATH:/home/kony/.spicetify"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/home/kony/.bun/_bun" ] && source "/home/kony/.bun/_bun"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export QTDIR=/usr/lib/qt6
export PATH=$QTDIR/bin:$PATH
export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH
export QT_QPA_PLATFORM_PLUGIN_PATH=$QTDIR/plugins

alias ls='eza -a --icons=always'
alias ll='eza -al --icons=always'
alias lt='eza -a --tree --level=1 --icons=always'
compdef eza=ls

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias nixwayclip='devenv processes up'

source <(fzf --zsh)

[ -f "$HOME/.zshrc.secrets" ] && source "$HOME/.zshrc.secrets"

eval "$(zoxide init zsh --cmd cd)"

fastfetch
export PATH="$HOME/.cargo/bin:$PATH"
