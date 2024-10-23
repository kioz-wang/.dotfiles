return {
  "smoka7/hop.nvim",
  lazy = true,
  opts = {},
  keys = {
    {
      -- use "cl" to delete characters and start insert instead.
      "s",
      "<CMD>HopChar2<CR>",
      desc = "Cursor move by HopChar2"
    },
    {
      -- use "cc" to delete lines and start insert instead.
      "S",
      "<CMD>HopWord<CR>",
      desc = "Cursor move by HopWord"
    },
  },
}
