return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "→",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"bashls",
				"eslint",
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"emmet_ls",
				"marksman",
				"jsonls",
				"lua_ls",
				"taplo",
				"gopls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				--formatters
				"prettier",
				"stylua",
				"gofumpt",
				"goimports-reviser",
				"golines",
				--linters
				"eslint_d",
			},
		})
	end,
}
