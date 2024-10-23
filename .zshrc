# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
# pip zsh completion end

# Virtualenv Manager Core [v0.1.0]
export WORKON_HOME=${HOME}/.venv
function kiVenv()
{
    local corepy
    local cmdfile
    corepy=${HOME}/Develops/ki_venv/core.py
    if [ $# -eq 0 ]; then
        ${corepy} --help
        return
    fi
    cmdfile=$(mktemp ${HOME}/Develops/ki_venv/kivenv_cmd.XXXX)
    ${corepy} --shell bash --command-file ${cmdfile} $@
    if [ -s ${cmdfile} ]; then
        source ${cmdfile}
    fi
    rm ${cmdfile}
}

if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
fi
[ -f "${HOME}/.fzfrc" ] && export FZF_DEFAULT_OPTS_FILE="${HOME}/.fzfrc"

alias dgit='git --git-dir ${HOME}/.dotfiles/ --work-tree=${HOME}'
alias dlazygit='lazygit --git-dir ${HOME}/.dotfiles/ --work-tree=${HOME}'

export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static

[ -f "${HOME}/.ghcup/env" ] && . "${HOME}/.ghcup/env" # ghcup-env

# Add deno completions to search path
if [[ ":$FPATH:" != *":${HOME}/.zsh/completions:"* ]]; then export FPATH="${HOME}/.zsh/completions:$FPATH"; fi

export NPM_CONFIG_REGISTRY=https://registry.npmmirror.com
[ -f "${HOME}/.deno/env" ] && . "${HOME}/.deno/env"

