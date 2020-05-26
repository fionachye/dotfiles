# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

PS1='[\u@\h \w]\$ '
alias gl="git log --graph --abbrev-commit --pretty=oneline --decorate"
