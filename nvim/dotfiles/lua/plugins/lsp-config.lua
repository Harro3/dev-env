return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  }, {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "clangd",
        "jdtls",
        "dockerls",
        "docker_compose_language_service",
        "jsonls",
        "cssls",
        "html",
        "lemminx",
        "pylsp",
        "yamlls",
      },
    })
  end,
},

  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.jdtls.setup({
        capabilities = capabilities,
        cmd = {
          "jdtls",
          "-configuration " .. os.getenv("HOME") .. "/.cache/jdtls/config",
          "-data " .. os.getenv("HOME") .. "/.cache/jdtls/workspace",
          "--jvm-arg=" .. string.format(
            "-javaagent:%s",
            vim.fn.expand("$HOME/.local/share/nvim/mason/share/jdtls/lombok.jar")
          ),
        },
      })

      lspconfig.dockerls.setup({ capabilities = capabilities })
      lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
      lspconfig.jsonls.setup({ capabilities = capabilities })
      lspconfig.cssls.setup({ capabilities = capabilities })
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.lemminx.setup({ capabilities = capabilities })
      lspconfig.pylsp.setup({ capabilities = capabilities })
      lspconfig.yamlls.setup({ capabilities = capabilities })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>e", function()
        vim.diagnostic.open_float(0, { scope = "line" })
      end)
    end,
  },
}
