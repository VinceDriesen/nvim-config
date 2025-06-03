return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "frappe", -- kies uit: latte, frappe, macchiato, mocha
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
