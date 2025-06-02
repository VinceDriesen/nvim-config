-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		filesystem = {
			bind_to_cwd = true,
			follow_current_file = {
				enabled = true,
			},
			window = {
				mappings = {
					["n"] = "add", -- Nieuwe file aanmaken met 'n'
					["N"] = "add_directory", -- Nieuwe map maken met 'A'
					-- SHIFT+ENTER om cwd te veranderen naar geselecteerde map
					["<S-CR>"] = function(state)
						local node = state.tree:get_node()
						if node.type == "directory" then
							vim.cmd("cd " .. node.path)
							print("Changed directory to: " .. node.path)
							require("neo-tree.sources.filesystem.commands").refresh(state)
						else
							print("Not a directory")
						end
					end,

					-- "-" om naar bovenliggende directory te gaan
					["-"] = function(state)
						local cwd = vim.fn.getcwd()
						local parent = vim.fn.fnamemodify(cwd, ":h")
						vim.cmd("cd " .. parent)
						require("neo-tree.sources.filesystem.commands").refresh(state)
						print("Terug naar: " .. parent)
					end,
				},
			},
		},
	},
}
