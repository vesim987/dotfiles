export ZSH=~/.local/share/oh-my-zsh/

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_TRANSIENT_PROMPT=always
plugins=(
  archlinux
  autojump
  command-not-found
  common-aliases
  extract
  pip
  python
  ssh-agent
  sudo
  systemd
  fzf
  fzf-docker
  tmux
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  virtualenv
  virtualenvwrapper
)

source $ZSH/oh-my-zsh.sh

