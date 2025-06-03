return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			contrast = "hard",
			dim_inactive = true,
			transparent_mode = false,
		})
		vim.cmd.colorscheme("gruvbox")
	end,
}
