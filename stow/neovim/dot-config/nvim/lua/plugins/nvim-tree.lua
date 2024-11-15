return {
  "nvim-tree/nvim-tree.lua",
  version = 'v1.8.x',
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      '<leader>e',
      function()
        local api = require('nvim-tree.api')
        if api.tree.is_tree_buf() then
          api.tree.close()
          api.tree.toggle({ focus = false })
        else
          api.tree.focus()
        end
      end,
      desc = 'Toggle file explorer'
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
        max = 35,
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
