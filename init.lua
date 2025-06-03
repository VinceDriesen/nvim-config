-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("defaults/settings")
require("defaults/keymaps")

-- lazy.nvim setup

require("lazy").setup({
	-- plugins map
	{ import = "plugins" },

	-- themes map
	{ import = "themes" },

	defaults = {
		lazy = false, -- of true, wat je wilt als standaard
	},
})

-- treesitter config
local config = require("nvim-treesitter.configs")
config.setup({
	ignore_install = {},
	ensure_installed = {
		"typst",
		"purescript",
		"nix",
		"nim",
		"vimdoc",
		"go",
		"rust",
		"c",
		"lua",
		"python",
		"html",
		"css",
		"javascript",
		"typescript",
		"prisma",
		"haskell",
		"zig",
		"gleam",
		"wgsl",
		"php",
		"nim",
		"sql",
		"markdown",
		"latex",
		"gdscript",
		"gdshader",
	},
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	modules = {},
	sync_install = true,
	auto_install = true,
})
