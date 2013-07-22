# completion
if [ -f /usr/local/etc/bash_completion ];
then
	. /usr/local/etc/bash_completion
fi

#Mode vi
set -o vi

# options
set -o vi
shopt -s cdspell
shopt -s histappend histreedit histverify
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist

# export
export PATH=/sbin:/bin:/usr/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/X11R6/bin:/usr/local/scripts:$HOME/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BLOCKSIZE=K
export FTP_PASSIVE_MODE=NO
export HISTCONTROL="ignoredups"

PROMPT_COMMAND='history -a'

# bookmark
CDPATH=".:..:../..:/usr/local/www:/home/fch/tmp:/home/fch/download"

# set PS1
if [[ $SSH_CLIENT == '' ]];
then
	PS1GLOBALCOLOR="\[\033[0;36m\]"
else
	PS1GLOBALCOLOR="\[\033[0;32m\]"
fi

PS1USERCOLOR=$PS1GLOBALCOLOR

if [[ $SUDO_USER != '' ]];
then
	PS1USERCOLOR="\[\033[0;31m\]"
fi

case $TERM in
	xterm*)
		export PS1="\[\033]0;\u@\h:\w\007\]$PS1USERCOLOR\u$PS1GLOBALCOLOR@\h:\w\n$PS1GLOBALCOLOR\#>\[\033[0m\] "
		;;
	*)
		export PS1="\u@\h:\w\n\#> "
		;;
esac

# aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias df='df -kh'
alias ls='ls -laFoGh'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

if [[ $DISPLAY == '' ]];
then
	alias vi='vim 2>/dev/null'
	export SVN_EDITOR="/usr/local/bin/vim -f"
else
	alias vi='gvim 2>/dev/null'
	export SVN_EDITOR="/usr/local/bin/gvim -f"
fi

export EDITOR="/usr/local/bin/vim"

#CCACHE
export PATH=/usr/local/libexec/ccache:$PATH
export CCACHE_PATH=/usr/bin:/usr/local/bin
export CCACHE_DIR=/usr/.ccache
export CCACHE_LOGFILE=/var/log/ccache.log

if [[ -x /usr/local/bin/ccache ]];
then
  /usr/local/bin/ccache -M 4GB > /dev/null
fi
