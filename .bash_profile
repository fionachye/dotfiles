# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export PS1="\e[1;34m[\d \T \u@\h:\e[m \e[1;32m\w]\e[m\$ "
