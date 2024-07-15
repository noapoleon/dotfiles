return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
			vim.keymap.set('n', '<leader>m', ":Mason<CR>", {})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					--"ast_grep",
					--"pyright",
					-- "mypy",
					-- "ruff",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})
			--lspconfig.ast_grep.setup({})
			--lspconfig.pyright.setup({})
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
		end,
	}
}
