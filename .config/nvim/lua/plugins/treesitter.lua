return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function () 
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "cpp", "make", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "css", "php", "python" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = false },  
		})
	end,
}
