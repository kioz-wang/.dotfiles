return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    lazy = true,
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    opts = {
      -- https://stackoverflow.com/questions/45907039/vim-mapping-ctrl-or-c-to-c-ww
      open_mapping = "<A-t>",
      float_opts = {
        border = 'rounded',
      },
    },
    keys = {
      { '<A-T>', "<CMD>ToggleTerm direction=float<CR>", mode = {'i', 'n'}, desc = 'Toggle Term (float)' },
    }
  },
}
