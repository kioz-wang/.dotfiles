local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.cursorline = true

opt.clipboard = "unnamedplus"

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.signcolumn = "yes"

require("config.keymaps")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

-- vim.cmd([[colorscheme tokyonight-storm]])
vim.cmd.colorscheme "catppuccin"

