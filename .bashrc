if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
elif [ -f /usr/local/etc/bash_completion ]; then
	. /usr/local/etc/bash_completion
elif [ -f /etc/profile.d/bash_completion.sh ]; then
	. /etc/profile.d/bash_completion.sh
fi

. /usr/share/git-core/contrib/completion/git-prompt.sh

shopt -s cdspell
shopt -s histappend histreedit histverify
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist

export PATH=$PATH:/usr/local/scripts:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export FTP_PASSIVE_MODE=NO

export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }history -a;history -c;history -r"

if [[ $SSH_CLIENT == '' ]]; then
	PS1GLOBALCOLOR="\[\033[0;36m\]"
else
	PS1GLOBALCOLOR="\[\033[0;32m\]"
fi

PS1USERCOLOR=$PS1GLOBALCOLOR

if [[ $SUDO_USER != '' ]]; then
	PS1USERCOLOR="\[\033[0;31m\]"
fi

case $TERM in
xterm*)
	export PS1="\[\033]0;\u@\h:\w\007\]$PS1USERCOLOR\u$PS1GLOBALCOLOR@\h:\w\$(__git_ps1 \"(%s)\")\n$PS1GLOBALCOLOR\#|\!>\[\033[0m\] "
	;;
*)
	export PS1="\u@\h:\w\n\#|\!> "
	;;
esac

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias df='df -kh'
alias ls='ls -vlaFoGh --group-directories-first'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

if [[ $DISPLAY == '' ]]; then
	alias vi='nvim 2>/dev/null'
	export EDITOR="nvim -f"
else
	alias vi='nvim-qt --maximized 2>/dev/null'
	export EDITOR='nvim-qt --maximized 2>/dev/null'
fi

export BLOCKSIZE=K
export HISTCONTROL="ignoredups"
export CDPATH=~:~/Norsys/Clients:~/Norsys/Formations
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export EDITOR="vi"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # This loads nvm bash_completion

source "$HOME/.profile"
