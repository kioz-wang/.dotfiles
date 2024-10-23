return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        if require("nvim-treesitter.parsers").has_parser() then
          vim.opt.foldenable = false
          vim.opt.foldmethod = "expr"
          vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        else
          vim.opt.foldmethod = "syntax"
        end
      end,
    })
  end,
}
