require("noice").setup({
lsp ={
    --override markdown rendering so that **cmp** and other plugins use Treesitter
    override ={
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  --enable preset for easier configuration 
  presets ={
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename =false,
    lsp_doc_border = false,

  },
})

--dismiss message 
vim.keymap.set("n","<leader>nd", "<cmd>NoiceDismiss<CR>", {desc = "Dismiss message"})
