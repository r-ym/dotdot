# Created by Zap installer

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(direnv hook zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/raman/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/raman/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/raman/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/raman/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# ALIASES
alias ww='cd /Volumes/Workspace'
alias ll='ls -la'
alias gs='git status'
alias kk='tmux kill-session'
alias nvim='nvim .'
# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/raman/.opam/opam-init/init.zsh' ]] || source '/Users/raman/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

setopt PROMPT_SUBST
PROMPT='$([ -n "$CONDA_DEFAULT_ENV" ] && echo "($CONDA_DEFAULT_ENV) ")'"$PROMPT"
