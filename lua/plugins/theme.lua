vim.pack.add({
  "https://github.com/RostislavArts/naysayer.nvim"
})

vim.cmd.colorscheme("naysayer")

-- Fix explorer/picker highlights for naysayer
local fg = "#d4d4d4"    -- Light gray for text
local bg = "#062329"    -- Naysayer background
local green = "#44b340" -- Naysayer green accent

vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = green })
vim.api.nvim_set_hl(0, "SnacksPickerFile", { fg = fg })
vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = "#6a7a7a" })
vim.api.nvim_set_hl(0, "SnacksPickerMatch", { fg = "#ffee00", bold = true })
vim.api.nvim_set_hl(0, "Directory", { fg = green })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = green, bg = bg })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#0a3a3a" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#0a4a4a" })


-- Indent guide colors
vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#0a4a4a" })      -- Dim lines for all indents
vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#44b340" }) -- Green for current scope
vim.api.nvim_set_hl(0, "SnacksIndentChunk", { fg = "#44b340" }) -- Green for current chunk
