# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export LC_ALL="zh_CN.UTF-8"
export LANG="zh_CN.UTF-8"
export TERM="linux"
alias tt='tmux -2 attach-session -t'
alias tl='tmux -2 list-session'
alias tmux='tmux -2'
export EDITOR="vim"
ulimit -c unlimited

echo bash_profile Initialization!
