require("lazy").setup({
	-- gruvbox plugin
	{ "ellisonleao/gruvbox.nvim", priority = 1000,  config = true, opts = ... },

	--telescope plugin
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	},
	-- "gc" to comment visual regions/lines
	{ 'numToStr/Comment.nvim',    opts = {} },
	-- Telescope and dependencies

	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			--fzf finder algo which requires local dependencis to be build
			-- only load if "make" is available. make sure system requrements installed.
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
		},
	},

	--telescope frecency extention
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension "frecency"
		end,
		vim.keymap.set("n", "<leader>tf", "<Cmd>Telescope frecency<CR>")
	},
	{
		"nvim-telescope/telescope-dap.nvim"
	},
	--indent guides even on blank lines
	{
		'lukas-reineke/indent-blankline.nvim',
		main = "ibl",
		opts = {},
	},
	-- Git related plugins
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',
	--vim wiki
	'vimwiki/vimwiki',

	--plugin for toggling relative and absolute line number
	'sitiom/nvim-numbertoggle',

	--latex plugin
	'lervag/vimtex',
	--debugger
	"mfussenegger/nvim-dap",
	--debugger extention for go
	"leoluz/nvim-dap-go",
	"rcarriga/nvim-dap-ui",
	--adds virtual text support for dap
	"theHamsta/nvim-dap-virtual-text",

	--markdown preview
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app & yarn install",
		ft = { "markdown", "md" }
	},
	-- leap plugin
	'ggandor/leap.nvim',
	dependencies = {
		'tpope/vim-repeat',
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	-- NOTE: plugins related to LSP
	--  The configuration is done below. Search for lspconfig to find it below.

	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
		},
	},


	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			--cmp from buffer
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-path',
			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',
			--cmd line capabilities
			'hrsh7th/cmp-cmdline',
			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
		},
	},
	-- Useful plugin to show you pending keybinds.
	{ 'folke/which-key.nvim', opts = {} },
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

				-- don't override the built-in and fugitive keymaps
				local gs = package.loaded.gitsigns
				vim.keymap.set({ 'n', 'v' }, ']c', function()
					if vim.wo.diff then return ']c' end
					vim.schedule(function() gs.next_hunk() end)
					return '<Ignore>'
				end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
				vim.keymap.set({ 'n', 'v' }, '[c', function()
					if vim.wo.diff then return '[c' end
					vim.schedule(function() gs.prev_hunk() end)
					return '<Ignore>'
				end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
			end,
		},
	},
	--auto pair plugin
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},

	{
		-- Set lualine as statusline
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons', opt = true
		},
		opts = {
			options = {
				component_separators = '|',
				theme = 'everforest',
				section_separators = '',
			},
		},
	},

	-- See `:help lualine.txt`

})
