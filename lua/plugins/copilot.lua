return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = false,
				auto_refresh = false,
				keymap = {
					jump_prev = "<C-p>",
					jump_next = "<C-n>",
					accept = "<C-y>",
					refresh = "<C-r>",
					open = "<C-o>",
				},
				layout = {
					position = "bottom", -- or "left"
					ratio = 0.4, -- Adjust the size of the panel
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,

				keymap = {
					accept = "<C-l>",
				},
			},
		})
	end,
}
