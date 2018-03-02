# .bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Readline settings
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'set colored-stats on'
bind 'set colored-completion-prefix on'
bind 'set mark-directories on'
bind 'set mark-symlinked-directories on'
bind 'set print-completions-horizontally on'
bind 'set show-all-if-unmodified on'
stty werase undef
bind '\\C-w:unix-filename-rubout'

HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Check window size
shopt -s checkwinsize

# Aliases
alias vim='nvim'
alias ls='ls -v --color=auto --group-directories-first --block-size=M --quoting-style=literal'
alias llb='lsblk -o SIZE,NAME,LABEL,MOUNTPOINT,FSTYPE,UUID'
alias ll='ls -la'
alias l='ls -l'
alias mv='mv -vi'
alias info='info --vi-keys'
alias dd='dd status=progress'
alias pacman='pacman --color auto'
alias code_format='astyle -A2 --indent=force-tab=8 -C -xG -S -Y -m0 -f -H -U -xe -E -j -xL -q --lineend=linux'
alias checkkeysyms="xev | sed -n 's/^.*keycode *\([0-9]\+\).*$/keycode \1 = /p'"
alias grep='grep --color=auto'
alias tmux='tmux -2'
alias rm='rm -i'
alias ssh-agent='eval $(/usr/bin/ssh-agent -a /tmp/$USER.agent)'
alias gvim='nvim-gtk'
alias chmod='chmod -c'
alias chown='chown -c'
alias cp='cp -i'
alias upgrade='sudo apt-get update && sudo apt-get upgrade'
alias ..='cd ..'

# Functions
function mkcd {
	mkdir "$1"
	cd "$1"
}

function cds {
	cd "$1"
	ls
}

function launch {
	"$@" 2>/dev/null & disown
}

function bak {
	cp -r "$1" "$1".bak
}

function lsza {
	for f in ./* ; do
		du -sh $f
	done
}

function for-file {
	if [[ $1 == "-h" ]] ; then
		for file in * ; do
			if [[ -f $file ]] ; then
				echo $file
			fi
		done
		for file in .* ; do
			if [[ -f $file ]] ; then
				echo $file
			fi
		done
	else
		for file in * ; do
			if [[ -f $file ]] ; then
				echo $file ;
			fi
		done
	fi
}

function for-dir {
	if [[ $1 == "-h" ]] ; then
		for dir in * ; do
			if [[ -d $dir ]] ; then
				echo $dir ;
			fi
		done
		for dir in .* ; do
			if [[ -d $dir ]] ; then
				if [[ $dir == ".." ]] || [[ $dir == "." ]] ; then
					true
				else
					echo $dir ;
				fi
			fi
		done
	else
		for dir in * ; do
			if [[ -d $dir ]] ; then
				echo $dir ;
			fi
		done
	fi
}

function lolman {
	man $1 | lolcat -f | less -RSMsi
}

# Execute command after every prompt
# This writes the last command to history,
# preserving history from all terminals
export PROMPT_COMMAND='history -a'

# Environment variables
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
PERL_MB_OPT="--install_base \"$HOME/perl5\""
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

export PAGER='less -RSMsi'
export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='firefox-nightly'
export GOPATH="$HOME/go/bin"
export PERL5LIB
export PERL_LOCAL_LIB_ROOT
export PERL_MB_OPT
export PERL_MM_OPT

PATH=/opt/puppetlabs/bin/:$HOME/perl5/bin:$HOME/.gem/ruby/2.4.0/bin/:$HOME/bin/:$PATH:/usr/lib/plan9/bin/

# Enable fzf
if [[ -f $HOME/.fzf.bash ]] ; then
	source $HOME/.fzf.bash
fi

# Enable bash completion
if ! shopt -oq posix; then
	if [[ -f /usr/share/bash-completion/bash_completion ]]; then
		source /usr/share/bash-completion/bash_completion
	elif [[ -f /etc/bash_completion ]]; then
		source /etc/bash_completion
	fi
fi

# Check for color support
if [[ -x /usr/bin/tput ]] && tput setaf 1>&/dev/null; then
	color_prompt=yes
else
	color_prompt=
fi

# Color codes for the prompt
COLOR_RED="\[\033[0;31m\]"
COLOR_LIGHT_RED="\[\033[1;31m\]"
COLOR_BLUE="\[\033[0;34m\]"
COLOR_WHITE="\[\033[1;37m\]"
COLOR_LIGHT_BLUE="\[\033[1;34m\]"
COLOR_RESET="\[\033[0m\]"

# Check if current directory is a git repo and check it's status
function git_status {
	GIT_STATUS=$(git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n')
	if [[ -n $GIT_STATUS ]] ; then
		echo " $GIT_STATUS"
	fi
}

# Change prompt color for root user
function user_status {
	if [[ $UID -gt 0 ]] ; then
		USER_COLOR="\[\033[0;37\]"
	else
		USER_COLOR="\[\033[0;31m\]"
	fi
}

function hostname_status {
	echo "$HOSTNAME"
}

# Display the error code of last command
function error_status {
	error_code=$?
	if [[ $error_code -ne 0 ]] ; then
		echo "$error_code "
	fi
}

if [[ -n $color_prompt ]] ; then
	PS1="\n$COLOR_RED\$(error_status)$COLOR_RESET\$(user_status)$USER_COLOR\u@$COLOR_LIGHT_BLUE\$(hostname_status)$COLOR_RESET \W$COLOR_WHITE\$(git_status)$COLOR_RESET \$ "
else
	PS1="\$(error_status)\$(user_status)@\$(hostname_status)\W\$\$(git_status)"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
