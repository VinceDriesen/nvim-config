-- Theme

local theme_state_file = vim.fn.stdpath("state") .. "/last_theme.txt"

local function load_last_theme()
	local f = io.open(theme_state_file, "r")
	if f then
		local theme_name = f:read("*l")
		f:close()
		if theme_name then
			local ok, theme = pcall(require, "themes." .. theme_name)
			if ok and theme.config then
				theme.config()
				print("Loaded theme from last session: " .. theme_name)
				return
			end
		end
	end
	print("No previous theme found, loading default theme")
	-- fallback: laad hier je default theme
	local default_theme = "jouw_default_theme_naam"
	local ok, theme = pcall(require, "themes." .. default_theme)
	if ok and theme.config then
		theme.config()
	end
end


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

load_last_theme()
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
