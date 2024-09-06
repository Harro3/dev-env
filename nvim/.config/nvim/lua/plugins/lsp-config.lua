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
					"texlab", -- LaTeX language server
					"marksman", -- Markdown language server
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
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
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
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.cmake.setup({ capabilities = capabilities })

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
			-- Configure markdown to also use texlab
			-- lspconfig.markdown.setup({
			--   capabilities = capabilities,
			--   on_attach = function(client, bufnr)
			--     -- Add additional key mappings or settings specific to markdown + LaTeX here
			--   end,
			-- })
			lspconfig.marksman.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show info" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
			vim.keymap.set("n", "<leader>e", function()
				vim.diagnostic.open_float(0, { scope = "line" })
			end)
		end,
	},
}
