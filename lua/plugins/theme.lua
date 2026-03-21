vim.pack.add({
  "https://github.com/olimorris/onedarkpro.nvim"
})

require("onedarkpro").setup({
  styles = {
    comments = "italic",
  },
  options = {
    transparency = true,
  }
})

-- onedark
-- onelight
-- onedark_vivid
-- onedark_dark
-- vaporwave
vim.cmd("colorscheme vaporwave")
