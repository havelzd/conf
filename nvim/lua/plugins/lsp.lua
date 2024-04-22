-- return {
--     -- Mason manager
--     {
--         "williamboman/mason.nvim",
--         lazy = false,
--         config = function()
--             require("mason").setup()
--         end,
--     },
--     -- mason lsp
--     {
--         "williamboman/mason-lspconfig.nvim",
--         lazy = false,
--         opts = {
--             auto_install = true,
--         },
--         config = function()
--             require("mason-lspconfig").setup({
--                 ensure_installed = { "lua_ls" },
--             })
--         end,
--     },
--     {
--         "neovim/nvim-lspconfig",
--         config = function()
--             local lspconfig = require("lspconfig")
--             local cmp_lsp = require("cmp_nvim_lsp")
--             local capabilities =
--                 vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(),
--                     cmp_lsp.default_capabilities())
--
--             local angular_cmd = {
--                 "node",
--                 "/usr/lib/node_modules/@angular/language-server",
--                 "--stdio",
--                 "--ngProbeLocations",
--                 "/usr/lib/node_modules",
--                 "--tsProbeLocations",
--                 "/usr/lib/node_modules",
--             }
--
--             lspconfig.lua_ls.setup({ capabilities = capabilities })
--
--             lspconfig.html.setup({ capabilities = capabilities })
--             lspconfig.cssls.setup({ capabilities = capabilities })
--             lspconfig.tsserver.setup({ capabilities = capabilities })
--             lspconfig.angularls.setup({
--                 cmd = angular_cmd,
--                 on_new_config = function(new_config, new_root_id)
--                     new_config.cmd = angular_cmd
--                 end,
--                 capabilities = capabilities,
--             })
--
--             lspconfig.pylsp.setup({ capabilities = capabilities })
--             lspconfig.rust_analyzer.setup({ capabilities = capabilities })
--
--             -- keymaps
--             vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
--             vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
--             vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
--             vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)
--         end,
--     },
-- }
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },

  config = function()
    local lspconfig = require("lspconfig")
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities =
      vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      },
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
      }, {
        { name = "buffer" },
      }),
    })

    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    local angular_cmd = {
      "node",
      "/usr/lib/node_modules/@angular/language-server",
      "--stdio",
      "--ngProbeLocations",
      "/usr/lib/node_modules",
      "--tsProbeLocations",
      "/usr/lib/node_modules",
    }

    lspconfig.lua_ls.setup({ capabilities = capabilities })

    lspconfig.html.setup({ capabilities = capabilities })
    lspconfig.cssls.setup({ capabilities = capabilities })
    lspconfig.tsserver.setup({ capabilities = capabilities })
    lspconfig.angularls.setup({
      cmd = angular_cmd,
      on_new_config = function(new_config, new_root_id)
        new_config.cmd = angular_cmd
      end,
      capabilities = capabilities,
    })

    lspconfig.pylsp.setup({ capabilities = capabilities })
    lspconfig.rust_analyzer.setup({ capabilities = capabilities })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)
  end,
}
