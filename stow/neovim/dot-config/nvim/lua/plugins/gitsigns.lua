return {
  {
    "lewis6991/gitsigns.nvim",
    event = 'VeryLazy',
    opts = {
      numhl = true,
      -- linehl = true,
      -- issue: line blame will be synchronized on all unfocused buffers.
      -- current_line_blame = true,
    },
    keys = {
      {
        '<leader>gS',
        ':Gitsigns stage_hunk<CR>',
        desc = 'Git stage (hunk)'
      },
      {
        '<leader>gU',
        ':Gitsigns undo_stage_hunk<CR>',
        desc = 'Undo the last stage (hunk)'
      },
      {
        '<leader>gR',
        ':Gitsigns reset_hunk<CR>',
        desc = 'Git reset (hunk)'
      },
      {
        '<leader>gs',
        ':Gitsigns stage_buffer<CR>',
        desc = 'Git stage (local)'
      },
      {
        '<leader>gr',
        ':Gitsigns reset_buffer<CR>',
        desc = 'Git reset (local)'
      },
      {
        '<leader>gtb',
        ':Gitsigns blame_line<CR>',
        desc = 'Git blame floating (line)'
      },
      {
        '<leader>gtd',
        ':Gitsigns toggle_deleted<CR>',
        desc = 'Toggle git show the old version of hunks inline (local)'
      },
    }
  },
}
