return {
  "mhartington/formatter.nvim",
  lazy = true,
  keys = {
    {
      '<leader>F',
      '<CMD>FormatWrite<CR>',
      desc = 'Format the buffer'
    },
  },
  config = function()
    require("formatter").setup({
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        ["*"] = {
          require("formatter.defaults").prettier,
        },
      }
    })
  end,
}
