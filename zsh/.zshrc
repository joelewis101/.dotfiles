
eval "$(starship init zsh)"
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


alias r="radian"
alias mux="tmuxinator"
export EDITOR=nvim
# man pages with nvim
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# vim mode
bindkey -v

# setup fzf# setup fzf# setup fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=40%
--multi
--preview-window=:hidden
--bind '?:toggle-preview'
--preview 'cat {}'
"
export FZF_DEFAULT_COMMAND='find .'

# aliases

alias ls='ls -G'
alias lsa='ls -alh'
alias md='mkdir -p'

alias gs='git status'
alias ga='git add'
alias gc='git commit'

alias proj="cd ~/projects"
alias docs="cd ~/Documents"

# joes scripts
export PATH="/Users/joseph.lewis/scripts:$PATH"

# fix <C-o> mutt
stty discard undef

vicd()
{
    local dst="$(command vifm --choose-dir - "$@")"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

