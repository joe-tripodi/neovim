vim.pack.add({
  "https://github.com/olimorris/onedarkpro.nvim"
})

local light = false
local config = {
  styles = {
    comments = "italic",
  },
  options = {
    transparency = true,
  },

}
if light then
  config.highlights = {
    CursorLine = { bg = "#e5e5e5" },
    CursorLineNr = { bg = "#e5e5e5" },
    GitSignsCurrentLineBlame = { fg = "#000000" },
  }
end

require("onedarkpro").setup(config)

-- onedark
-- onelight
-- onedark_vivid
-- onedark_dark
-- vaporwave
-- colorscheme
if light then
  vim.cmd("colorscheme onelight")
else
  vim.cmd("colorscheme vaporwave")
end
