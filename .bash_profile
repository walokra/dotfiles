# .bash_profile

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
# avoid overwriting existing files with output redirection (override >!)
set -o noclobber

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_CTYPE="fi_FI.UTF-8"
export LC_TIME="fi_FI.UTF-8"
export LESSCHARSET="utf-8"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
export PATH

