return {
	-- Themes
	--{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	--{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	--{ "rebelot/kanagawa.nvim", priority = 1000},
	--{ "nyoom-engineering/oxocarbon.nvim", priority = 1000},
	--{ "marko-cerovac/material.nvim", priority = 1000},
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	name = "vscode",
	config = function()
		vim.cmd.colorscheme("vscode")
	end,
}
