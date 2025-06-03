return {
	"EdenEast/nightfox.nvim",
	priority = 1000,
	config = function()
		require("nightfox").setup({
			options = {
				transparent = false,
				styles = {
					comments = "italic",
					keywords = "bold",
				},
			},
		})
		vim.cmd.colorscheme("nightfox")
	end,
}
