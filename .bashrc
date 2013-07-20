# .bashrc

# Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

# User specific aliases and functions

# Test for an interactive shell. There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi

# source settings from .bash_profile
# Why source from .bashrc: https://github.com/janmoesen/tilde/blob/master/.bashrc
[ -n "$PS1" ] && source ~/.bash_profile

