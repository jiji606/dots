
#              __
#  ____  _____/ /_  __________
# /_  / / ___/ __ \/ ___/ ___/
#  / /_(__  ) / / / /  / /__
# /___/____/_/ /_/_/   \___/
#
#

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'l:|=* r:|=*' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 0
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
autoload -Uz colors
autoload edit-command-line
compinit
colors

bindkey -v
bindkey "^R" history-incremental-search-backward

VIMODE='--INSERT --'
function zle-keymap-select zle-line-init {
	RPS1="${${KEYMAP/vicmd/- NORMAL -}/(main|viins)/- INSERT -}"
	RPS2=$RPS1
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

alias vim='nvim'
alias vi='vim'
alias ll='ls -hal'
alias ls='ls -v --color=auto --group-directories-first --block-size=M --quoting-style=literal'
alias llb='lsblk -o SIZE,NAME,LABEL,MOUNTPOINT,FSTYPE,UUID'
alias ll='ls -la'
alias mv='mv -v'
alias info='info --vi-keys'
alias dd='dd status=progress'
alias pacman='pacman --color auto'
alias mystyle='astyle -A2\
	--indent=force-tab=8\
	-C\
	-xG\
	-S\
	-Y\
	-m0\
	-f\
	-H\
	-U\
	-xe\
	-E\
	-j\
	-xL\
	-q\
	--lineend=linux'
alias checkkeysyms="xev | sed -n 's/^.*keycode *\([0-9]\+\).*$/keycode \1 = /p'"
alias grep='grep --color=auto'
alias tmux='tmux -2'
alias mvim='nvim -u $HOME/.config/nvim/minivim.vim'
alias govim='nvim -u $HOME/.config/nvim/govim.vim'
alias govim_config='govim $HOME/.config/nvim/govim.vim'
alias mvim_config='mvim $HOME/.config/nvim/minivim.vim'
alias vim_config='vim $HOME/.config/nvim/init.vim'


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

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# source .dircolors

eval "$(dircolors $HOME/.dircolors)"


PATH=/home/common/scripts/:$HOME/.gem/ruby/2.4.0/bin/:$HOME/bin/:$PATH:/usr/lib/plan9/bin/:$HOME/go/bin

setopt appendhistory autocd nomatch notify
unsetopt beep
autoload -U colors && colors

export PAGER='less -RSMsi'
export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='chromium'
export GOPATH="$HOME/go/bin"

export RPROMPT="${VIMODE}"
export PROMPT="
%F{8} %~ %f
 ───  "


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
