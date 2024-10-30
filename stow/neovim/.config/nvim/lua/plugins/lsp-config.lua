return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    opts = {
      ensure_installed = {
        "lua_ls",
        -- "hls",
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_capa = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.clangd.setup({
        capabilities = lsp_capa,
      })

      vim.filetype.add({
        pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
      })
      lspconfig.hyprls.setup({})

      lspconfig.lua_ls.setup({
        capabilities = lsp_capa,
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.uv.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
              return
            end
          end
          client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              -- library = {
              --   vim.env.VIMRUNTIME,
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
              -- },
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
              library = vim.api.nvim_get_runtime_file("", true),
            },
          })
        end,
        settings = {
          Lua = {},
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function()
          local map = function(mode, lhs, rhs, desc)
            local opts = { buffer = true, desc = desc }
            vim.keymap.set(mode, lhs, rhs, opts)
          end

          map("n", "<leader>F", "<CMD>lua vim.lsp.buf.format()<CR><CMD>w<CR>", "Format the buffer by LSP")
          -- use <C-]> instead, and use <C-W_}> to preview
          -- map('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>', 'Jump to the definition')
          -- map('n', 'go', '<CMD>lua vim.lsp.buf.type_definition()<CR>', 'Jump to the definition of the type symbol')
          map("n", "<leader>sgD", "<CMD>lua vim.lsp.buf.declaration()<CR>", "Jump to the declaration")
          -- use telescope instead
          -- map("n", "gm", "<CMD>lua vim.lsp.buf.implementation()<CR>", "List all the implementations")
          -- map('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>', 'List all the references')
          map("n", "<F2>", "<CMD>lua vim.lsp.buf.rename()<CR>", "Rename all references to the symbol")
          map("n", "<F4>", "<CMD>lua vim.lsp.buf.code_action()<CR>", "Select a code action available")
          map(
            "n",
            "<leader>D",
            "<CMD>lua vim.diagnostic.open_float()<CR>",
            "Show diagnostics in a floating window"
          )
        end,
      })
    end,
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
    },
  },
}
