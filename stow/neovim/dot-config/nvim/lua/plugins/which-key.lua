return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      spec = {
        { "<leader>w", proxy = "<C-w>", group = "windows" },
        { "<leader>k", group = "killer" },
        { "<leader>q", group = "session" },
        { "<leader>g", group = "Git" },
      },
    },
    keys = {
      {
        -- "<leader>?",
        -- "<A-?>", not work with Wayland&Hyprland
        "<A-S-/>",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
        mode = { "n", "i", "v" }
      },
    },
  }
}
