push_path "${HOME}/.bun/bin"

[[ ! -f "${LOCALBIN_D}/node" ]] && ln -s $(command -v bun) "${LOCALBIN_D}/node"
