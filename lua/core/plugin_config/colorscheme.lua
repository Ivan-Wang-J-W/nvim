--[[require("gruvbox").setup({
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
})--]]



--[[require("nordic").setup({
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
	  on_palette = function(palette) return palette end,
    -- Enable bold keywords.
    bold_keywords = false,
    -- Enable italic comments.
    italic_comments = true,
    -- Enable general editor background transparency.
    transparent_bg = false,
    -- Enable brighter float border.
    bright_border = false,
    -- Reduce the overall amount of blue in the theme (diverges from base Nord).
    reduced_blue = true,
    -- Swap the dark background with the normal one.
    swap_backgrounds = false,
    -- Override the styling of any highlight group.
    override = {},
    -- Cursorline options.  Also includes visual/selection.
    cursorline = {
        -- Bold font in cursorline.
        bold = false,
        -- Bold cursorline number.
        bold_number = true,
        -- Avialable styles: 'dark', 'light'.
        theme = 'dark',
        -- Blending the cursorline bg with the buffer bg.
        blend = 0.7,
    },
    noice = {
        -- Available styles: `classic`, `flat`.
        style = 'flat',
    },
    telescope = {
        -- Available styles: `classic`, `flat`.
        style = 'flat',
    },
    leap = {
        -- Dims the backdrop when using leap.
        dim_backdrop = false,
    },
    ts_context = {
        -- Enables dark background for treesitter-context window
        dark_background = true,
    }
})
--]]
vim.g.everforest_background = 'hard'
vim.o.background = "dark" -- or "light" for light mode
--vim.cmd("colorscheme nordic")
vim.cmd("colorscheme everforest")
--vim.cmd("colorscheme gruvbox")
