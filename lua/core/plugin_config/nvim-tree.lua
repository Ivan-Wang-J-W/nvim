
  vim.g.loaded_netrw = 1
  vim.g.load_netrwPlugin = 1
require("nvim-tree").setup({

 vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', { silent = true }),
 vim.keymap.set('n', '<c-j>', [[<Cmd>wincmd j<CR>]], { silent = true }),
 vim.keymap.set('n', '<c-h>', [[<Cmd>wincmd h<CR>]], { silent = true }),
 vim.keymap.set('n', '<c-l>', [[<Cmd>wincmd l<CR>]], { silent = true }),
})
