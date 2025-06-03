-- toggleterm.lua
-- https://github.com/akinsho/toggleterm.nvim

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false, -- meteen laden
	opts = {
		size = 20,
		open_mapping = [[<c-\>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 1,
		start_in_insert = true,
		insert_mappings = true,
		terminal_mappings = true,
		persist_size = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
			float_opts = {
				border = "double",
			},
		})

		function _G.toggle_lazygit()
			lazygit:toggle()
		end
	end,
	keys = {
		{
			"<leader>tg",
			function()
				_G.toggle_lazygit()
			end,
			desc = "Toggle lazygit terminal",
			silent = true,
			noremap = true,
		},

		{
			"<leader>tt",
			"<cmd>ToggleTerm direction=horizontal<CR>",
			desc = "Toggle terminal (bottom split)",
			silent = true,
			noremap = true,
		},
	},
}
