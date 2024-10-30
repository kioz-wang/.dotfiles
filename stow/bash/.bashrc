#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# start::completion
if [[ -d "${XDG_CONFIG_HOME:-${HOME}/.config}/bash_completion.d/" ]]; then
  for bash_completion in "${XDG_CONFIG_HOME:-${HOME}/.config}/bash_completion.d/*"; do
    [[ -r "${bash_completion}" ]] && . "${bash_completion}"
  done
fi
# end::completion

# start::fzf
if command -v fzf &> /dev/null; then
  eval "$(fzf --bash)"
fi
[[ -r "${HOME}/.fzfrc" ]] && export FZF_DEFAULT_OPTS_FILE="${HOME}/.fzfrc"
# end::fzf

# start::proxy
# go, dont use `go env -w`, some issue would be occur
export GO111MODULE=on
export GOPROXY=https://goproxy.io,direct
# rustup
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
# npm
export NPM_CONFIG_REGISTRY=https://registry.npmmirror.com
# end::proxy

# start::deno
[[ -r "${HOME}/.deno/env" ]] && . "${HOME}/.deno/env"
# end::deno

