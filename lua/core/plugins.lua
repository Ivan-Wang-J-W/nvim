require("lazy").setup({
	--colorschemes
	-- gruvbox plugin
	{ "ellisonleao/gruvbox.nvim",  config = function()require 'gruvbox'.load() end},
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		config = function()
			require 'nordic'.load()
		end
	},
	{
		"neanias/everforest-nvim", config = function ()require 'everforest'.load()
		end
	},
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
	-- NOTE: plugins related to LSPnoti
	--  The configuration is done below. Search for lspconfig to find it below.
	{
		{
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v3.x',
			lazy = true,
			config = false,
			init = function()
				-- Disable automatic setup, we are doing it manually
				vim.g.lsp_zero_extend_cmp = 0
				vim.g.lsp_zero_extend_lspconfig = 0
			end,
		},
		{
			'williamboman/mason.nvim',
			lazy = false,
			config = true,
		},

		-- Autocompletion
		{
			'hrsh7th/nvim-cmp',
			event = 'InsertEnter',
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
		--[[	config = function()
				-- Here is where you configure the autocompletion settings.
				local lsp_zero = require('lsp-zero')
				lsp_zero.extend_cmp()

				-- And you can configure cmp even more, if you want to.
				local cmp = require('cmp')
				local cmp_action = lsp_zero.cmp_action()

				cmp.setup({
					formatting = lsp_zero.cmp_format(),
					mapping = cmp.mapping.preset.insert({
						['<C-Space>'] = cmp.mapping.complete(),
						['<C-u>'] = cmp.mapping.scroll_docs(-4),
						['<C-d>'] = cmp.mapping.scroll_docs(4),
						['<C-f>'] = cmp_action.luasnip_jump_forward(),
						['<C-b>'] = cmp_action.luasnip_jump_backward(),
					})
				})
			end--]]
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'j-hui/fidget.nvim',                tag = 'legacy', opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require('mason-lspconfig').setup({
				ensure_installed = {
					'clangd', 'jdtls', 'gopls'
				},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						-- (Optional) Configure lua language server for neovim
						local lua_opts = lsp_zero.nvim_lua_ls()
						require('lspconfig').lua_ls.setup(lua_opts)
					end,
				}
			})
		end
	},

	--[[{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',

			-- Useful status updates for LSP, bottom right
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
		},
	},
--]]

	--pictogram for lsp
	{ 'onsails/lspkind.nvim' },
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
				vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
					{ buffer = bufnr, desc = 'Preview git hunk' })

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
	--leetcode plugin
	{
		{
			"kawre/leetcode.nvim",
			dependencies = {
				"MunifTanjim/nui.nvim",

				-- optional
				"rcarriga/nvim-notify",
			},
			opts = {
				-- configuration goes here
			},
		}
	},
	--terminal manager
	{
		'akinsho/toggleterm.nvim', version = "*", config = true
	},
})
