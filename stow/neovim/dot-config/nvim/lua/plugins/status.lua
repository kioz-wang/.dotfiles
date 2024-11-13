return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VimEnter",
    opts = {
      options = {
        globalstatus = true,
      },
    }
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader><leader>e",
        function() require("dropbar.api").pick() end,
        desc = "Breadcurmbs Picker",
      },
    },
    opts = {
      menu = {
        preview = false,
      }
    },
  }
}
