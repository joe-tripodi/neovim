vim.pack.add({
  "http://github.com/dchinmay2/alabaster.nvim"
})

vim.cmd.colorscheme("alabaster")

vim.api.nvim_set_hl(0, "@keyword", { fg = "#c678dd", bold = false })
vim.api.nvim_set_hl(0, "@comment", {
  fg = "#22CC22",
  italic = true,
  bold = true,
})
