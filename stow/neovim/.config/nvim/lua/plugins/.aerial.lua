return {
  {
    'stevearc/aerial.nvim',
    enabled = false,
    lazy = true,
    opts = {
      backends = {
        c = { "lsp", "treesitter" },
        cpp = { "lsp", "treesitter" },
      },
      filter_kind = {
        c = false,
        cpp = false,
      },
      attach_mode = "global",
      close_automatic_events = { "unsupported" },
    },
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    keys = {
      {
        '<leader>ts',
        -- ':AerialToggle<CR>',
        function()
          local api = require('aerial')
          local crtBuf = vim.api.nvim_get_current_buf()
          local crtBufFt = vim.api.nvim_get_option_value("filetype", { buf = crtBuf })
          if crtBufFt == "aerial" then
            api.close()
          else
            if api.is_open() then
              api.focus()
            else
              api.open({ focus = true })
            end
          end
        end,
        desc = 'Toggle symbols tree smartly'
      },
      {
        '<leader>tsn',
        ':AerialNavToggle<CR>',
        desc = 'Toggle symbol navigator'
      },
    },
  }
}
