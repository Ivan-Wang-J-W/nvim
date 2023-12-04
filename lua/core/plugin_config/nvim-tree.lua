
  vim.g.loaded_netrw = 1
  vim.g.load_netrwPlugin = 1
require("nvim-tree").setup({

 vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', { silent = true }),
})
