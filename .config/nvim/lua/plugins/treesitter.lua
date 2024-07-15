return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			--ensure_installed = { "c", "cpp", "make", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "htmldjango", "css", "php", "python" },
			ensure_installed = { "c", "cpp", "make", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "htmldjango", "css", "php"},
			sync_install = false,
			highlight = { enable = true },
			--indent = {
			--	enable = true,
			--	disable = {"python",},
			--},
			indent = { enable = false },
		})
	end,
}
