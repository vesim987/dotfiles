export ZSH=~/.local/share/oh-my-zsh/

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  archlinux
  autojump
  command-not-found
  common-aliases
  extract
  #last-working-dir
  pip
  python
  ssh-agent
  sudo
  systemd
  fzf
  fzf-docker
  tmux
  #vi-mode
  git
  zsh-autosuggestions
  virtualenv
  virtualenvwrapper
)

source $ZSH/oh-my-zsh.sh

