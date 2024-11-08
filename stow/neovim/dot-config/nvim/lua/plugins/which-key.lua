
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
    },
    keys = {
      {
        -- "<leader>?",
        "<A-?>",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
        mode = { "n", "i", "v" }
      },
    },
  }
}

