require("gruvbox").setup({
terminal_colors = true, -- add nvim terminal colors
undercurl = true,
underline = true,
bold = true,
italic = {
	strings =true,
	emphasis = true,
	comments = true,
	operators =false ,
	folds = true,
},
strikethrough = true,
invert_selection = false,
invert_signs = false,
invert_tabline = false,
invert_intend_guides = false,
inverse = true, -- invert background for search, diffs, status lines and errors
contrast = "", -- "hard/soft" or "empty"
palette_pverrides = {},
overrides = {},
dim_inactive = false,
transparent_mode = false,
})
vim.o.background = "dark" -- or "light" for light mode
vim.cmd("colorscheme gruvbox")
