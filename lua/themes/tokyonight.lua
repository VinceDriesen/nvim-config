return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		local function set_terminal_bg(hex)
			vim.fn.system({ "printf", "\027]11;" .. hex .. "\007" })
		end

		require("tokyonight").setup({
			styles = {
				comments = { italic = false },
			},
		})

		vim.cmd.colorscheme("tokyonight-night")

		-- Pas de terminal achtergrond aan hier:
		set_terminal_bg("#1a1b26") -- kleur van tokyonight-night
	end,
}
