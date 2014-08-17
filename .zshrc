autoload colors
colors
case ${UID} in
	0)
	PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
	PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
	SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
	;;
	*)
	PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
	PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
	SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
	PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
	;;
esac

setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep

bindkey -e
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char

bindkey '^O' accept-line-and-down-history
bindkey -a '^O' accept-line-and-down-history
bindkey '^B' push-line
bindkey -a '^B' push-line
bindkey -a '?' vi-history-search-backward
bindkey -a '/' vi-history-search-forward

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

bindkey "\e[Z" reverse-menu-complete

HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups
setopt share_history
setopt hist_ignore_all_dups

autoload zed

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)  %F{green}$vim%f"

setopt complete_aliases

case "${OSTYPE}" in
	freebsd*|darwin*)
	alias ls="ls -G -w"
	;;
	linux*)
	alias ls="ls --color"
	;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias lla="ls -l -a"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias rm=" rm -i"

alias newly="git log HEAD@{1}..HEAD --reverse"
alias newlyp="git log HEAD@{1}..HEAD -p --reverse"

alias git-num_of_commit='git log --pretty=oneline | wc -l '
alias git-num_of_commit_user="git log --pretty=format:'%aN' | sort | uniq -c"
alias git-hash_head='git log --pretty=format:'%h' | head'

[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine
;

ulimit -c unlimited

## PATH
export PATH=$HOME/local/bin/:$PATH

#virtualenv
#export WORKON_HOME=$HOME/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh

# GO
#export GOROOT=/usr/local/opt/go/libexec/
#export GOPATH=$HOME/.go
#export PATH=$PATH:$GOPATH/bin
