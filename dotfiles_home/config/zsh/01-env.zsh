export KEYTIMEOUT=1

export USRNAME=$USER

export EDITOR=nvim
export PAGER="nvimpager -p"

hash nvim && export MANPAGER="/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
hash nvim && export EDITOR=nvim
hash nvimpager && export PAGER=nvimpager

export FZF_COMPLETION_TRIGGER=','

