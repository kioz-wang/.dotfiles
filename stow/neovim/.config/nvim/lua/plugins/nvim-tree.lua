return {
  "nvim-tree/nvim-tree.lua",
  version = 'v1.7.x',
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      '<leader>e',
      function()
        local api = require('nvim-tree.api')
        local crtBuf = vim.api.nvim_get_current_buf()
        local crtBufFt = vim.api.nvim_get_option_value("filetype", { buf = crtBuf })
        if crtBufFt == "NvimTree" then
          api.tree.close()
        else
          api.tree.focus()
          -- the same as `update_focused_file.enable = true`
          -- api.tree.find_file({ open = true })
        end
      end,
      desc = 'Toggle file explorer smartly'
    },
  },
  opts = {
    filters = {
      custom = { "^.git$" },
    },
    disable_netrw = true,
    modified = {
      enable = true,
    },
    renderer = {
      hidden_display = "all",
      highlight_opened_files = "icon",
      highlight_modified = "name",
    },
    view = {
      width = {
        max = 45,
      },
    },
    diagnostics = {
      enable = true,
    },
    update_focused_file = {
      enable = true,
    },
    tab = {
      sync = {
        open = true,
        close = true,
      }
    },
  }
}
