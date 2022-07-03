export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="codespaces"
plugins=(git)
source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

autoload -U compinit
compinit

alias ll="ls -lh --color"
alias la="ls -a --color"
alias lla="ls -lha --color"

alias grep="grep --color=auto"

if [ -e "$HOME/.zshrc.workspace.sh" ]; then
  source "$HOME/.zshrc.workspace.sh"
fi
