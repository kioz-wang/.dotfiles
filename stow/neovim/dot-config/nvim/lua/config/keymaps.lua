vim.g.mapleader = " "

vim.opt.timeoutlen = 500

local map = vim.keymap.set

-- Line Display

map({ "n", "i" }, "<A-z>", function()
  vim.o.wrap = not vim.o.wrap
end, { desc = "Toggle wrap" })

-- Cursor Motion

map("n", "j", [[v:count ? 'j' : 'gj']], { expr = true })
map("n", "k", [[v:count ? 'k' : 'gk']], { expr = true })

-- Lines Movement

-- Note: there are some diffrences between `:` and `<CMD>`, be careful.
-- https://vim.fandom.com/wiki/Moving_lines_up_or_down#Mappings_to_move_lines
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line / block down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line / block up" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line / block down" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line / block up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line / block down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line / block up" })

map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Window Navigation

-- `<C-\><C-N>` can be used to go to Normal mode from any other mode without Ex mode.
map({ "i", "t" }, "<A-Left>", "<C-\\><C-N><C-w>h", { desc = "Focus window left" })
map({ "i", "t" }, "<A-Down>", "<C-\\><C-N><C-w>j", { desc = "Focus window down" })
map({ "i", "t" }, "<A-Up>", "<C-\\><C-N><C-w>k", { desc = "Focus window up" })
map({ "i", "t" }, "<A-Right>", "<C-\\><C-N><C-w>l", { desc = "Focus window right" })

map({ "n", "v" }, "<C-h>", "<C-w>h", { desc = "Focus window left" })
map({ "n", "v" }, "<C-j>", "<C-w>j", { desc = "Focus window down" })
map({ "n", "v" }, "<C-k>", "<C-w>k", { desc = "Focus window up" })
map({ "n", "v" }, "<C-l>", "<C-w>l", { desc = "Focus window right" })

-- Window Resize (Look from left-top window)

map({ "n", "v" }, "<C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Decrease window width" })
map({ "n", "v" }, "<C-Down>", "<CMD>resize +2<CR>", { desc = "Increase window height" })
map({ "n", "v" }, "<C-Up>", "<CMD>resize -2<CR>", { desc = "Decrease window height" })
map({ "n", "v" }, "<C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase window width" })

-- Misc

map("n", "<leader>kw", "<CMD>bdelete<CR>", { desc = "Close the buffer" })
map("n", "<leader>kt", "<CMD>tabclose<CR>", { desc = "Close the tab" })
map("n", "<leader>ka", "<CMD>qa<CR>", { desc = "Quit NeoVim" })
map("n", "<leader>fs", "<CMD>w<CR>", { desc = "Save current buffer" })
map("n", "<leader>fS", "<CMD>wa<CR>", { desc = "Save all buffers" })

map("n", "<leader>nh", ":nohl<CR>")

map({"v", "i", "n"}, "<A-i>", function ()
  local state = not vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(state)
  vim.notify(string.format("Toggle InlayHint -> %q", state))
end, { desc = "Toggle InlayHint" })

