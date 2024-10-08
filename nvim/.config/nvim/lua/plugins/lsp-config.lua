return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "cmake",
                    "bashls",
                    "lua_ls",
                    "clangd",
                    "jdtls",
                    "ts_ls",
                    "dockerls",
                    "docker_compose_language_service",
                    "jsonls",
                    "cssls",
                    "html",
                    "lemminx",
                    "pylsp",
                    "yamlls",
                    "marksman",
                    "texlab", -- LaTeX language server
                    "volar",
                },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
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

            require("mason-lspconfig").setup_handlers({
                -- Will be called for each installed server that doesn't have
                -- a dedicated handler.
                --
                function(server_name) -- default handler (optional)
                    -- https://github.com/neovim/nvim-lspconfig/pull/3232
                    -- if server_name == "tsserver" then
                    --     server_name = "ts_ls"
                    -- end
                    require("lspconfig")[server_name].setup({

                        capabilities = capabilities,
                    })
                end,
            })
            lspconfig.texlab.setup({
                capabilities = capabilities,
                settings = {
                    texlab = {
                        build = {
                            onSave = true,
                        },
                        forwardSearch = {
                            executable = "zathura",
                            args = { "--synctex-forward", "%l:1:%f", "%p" },
                        },
                        chktex = {
                            onEdit = true,
                            onOpenAndSave = true,
                        },
                    },
                },
            })

            -- Changer le `location` si jamais ça marche pas
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = "/usr/lib/@vue/typescript-plugin",
                            languages = { "javascript", "typescript", "vue" },
                        },
                    },
                },
                filetypes = {
                    "javascript",
                    "typescript",
                    "vue",
                },
            })

            -- Configure markdown to also use texlab
            -- lspconfig.markdown.setup({
            --   capabilities = capabilities,
            --   on_attach = function(client, bufnr)
            --     -- Add additional key mappings or settings specific to markdown + LaTeX here
            --   end,
            -- })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show info" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
            vim.keymap.set("n", "<leader>e", function()
                vim.diagnostic.open_float(0, { scope = "line" })
            end)
        end,
    },
}
