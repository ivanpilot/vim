export CLICOLOR=1
export TERM=xterm-256color
export LSCOLORS='exfxcxdxbxegedabagacad'
#alias ls='ls -lGH'

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[01;32m\]@\[\033[01;32m\]\u:\[\033[01;34m\]\W\[\033[35m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS2="| =>"

export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

. /Users/iplab/anaconda3/etc/profile.d/conda.sh
#conda activate
