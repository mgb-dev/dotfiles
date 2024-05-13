return {
	"neovim/nvim-lspconfig",
	event = {"BufReadPre", "BufNewFile"},
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{"antosha417/nvim-lsp-file-operations", config = true,},
		{"folke/neodev.nvim", opts = {},},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local map = vim.keymap.set
		local telescope = require("telescope.builtin")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspconfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true}

				-- keybinds
				opts.desc = "[G]o to [R]eferences"
				map("n", "gR", telescope.lsp_references, opts)

				opts.desc = "[G]o to [D]eclaration"
				map("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "[G]o to [d]efinition"
				map("n", "gd", telescope.lsp_definitions, opts)

				opts.desc = "[G]o to [I]mplementation"
				map("n", "gi", telescope.lsp_implementations, opts)

				opts.desc = "[G]o to [T]ype definition"
				map("n", "gt", telescope.lsp_type_definitions, opts)

				opts.desc = "[V]iew [C]ode [A]ctions"
				map({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, opts)

				opts.desc = "[R]e-[N]ame"
				map("n", "<leader>vrn", vim.lsp.buf.rename, opts)

				opts.desc = "hover to [K]now the docs"
				--this description is for the mnemonic memes
				map("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "[V]iew buffer [D]iagnostics"
				map("n", "<leader>vd", function()
					telescope.diagnostics({ bufnr = 0 })
				end, opts)

				opts.desc = "[V]iew [L]ine diagnostics"
				map("n", "<leader>vl", vim.diagnostic.open_float, opts)

				opts.desc = "[V]iew [P]rev diagnostic"
				map("n", "<leader>vp", vim.diagnostic.goto_prev, opts)

				opts.desc = "[V]iew [N]ext diagnostic"
				map("n", "<leader>vn", vim.diagnostic.goto_next, opts)

				opts.desc = "[V]iew [R]eferences"
				map("n", "<leader>vrr", vim.lsp.buf.references, opts)

				opts.desc = "[R]e-[S]tart LSP Server"
				map("n", "<leader>rs", "<CMD>LspRestart<CR>", opts)

				opts.desc = "Get signature help" -- rework description for this one
				map("i", "<C-h>", vim.lsp.buf.signature_help, opts)

				opts.desc = "[V]iew [W]orkspace [S]ymbol"
				map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
		
		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion ={
								callSnippet = "Replace",
							}
						},
					},
				})
			end,
			

		})

	end
}
