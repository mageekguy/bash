clear

bashCompletion=`brew --prefix`/etc/bash_completion

if [ -f $bashCompletion ]; then
	source $bashCompletion
fi

source ~/.profile
source ~/.bashrc
