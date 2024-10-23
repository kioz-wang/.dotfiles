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

export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

source <(fzf --zsh)
export FZF_DEFAULT_OPTS_FILE="${HOME}/.fzfrc"

alias dgit='git --git-dir ${HOME}/.dotfiles/ --work-tree=${HOME}'
alias dlazygit='lazygit --git-dir ${HOME}/.dotfiles/ --work-tree=${HOME}'

