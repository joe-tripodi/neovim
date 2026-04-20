-- Open File Explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- move selected lines of code
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- when jumping by half pages you keep the cursor in the middle of the view
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Update all plugins to the latest
vim.keymap.set("n", "<leader>pu", "<cmd>lua vim.pack.update()<CR>")

vim.keymap.set("n", "<leader>tt", function()
  require("plugins.jblow").toggle()
end, {
  desc = "Toggle jblow light/dark (dawn ↔ naysayer)",
  silent = true,
})
