-- Catppuccin
return {
	"catppuccin/nvim",
	lazy = false,
	name = "catpuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme "catppuccin"
	end
}

---- VSCode
--return {
--	"Mofiqul/vscode.nvim",
--	lazy = false,
--	priority = 1000,
--	name = "vscode",
--	config = function()
--		vim.cmd.colorscheme("vscode")
--	end,
--}
