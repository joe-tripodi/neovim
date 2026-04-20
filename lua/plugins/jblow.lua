-- jblow.lua – Naysayer dark + custom light "dawn" variant
-- Drop-in colorscheme, auto-switches based on vim.o.background

local M = {}

local variants = {
  main = { -- exact original naysayer dark
    _nc = "#16141f",
    base = "#031c1f",
    surface = "#031c1f",
    overlay = "#26233a",
    muted = "#6e6a86",
    subtle = "#908caa",
    text = "#bdb395",
    comment = "#31E32c",
    love = "#8eb69b",
    gold = "#f6c177",
    rose = "#3eb489",
    pine = "#e0def4",
    foam = "#9ccfd8",
    iris = "#429e9d",
    highlight_low = "#21202e",
    highlight_med = "#403d52",
    highlight_high = "#524f67",
    none = "NONE",
  },

  dawn = { -- light variant (flipped for bright environments)
    _nc = "#f4ede6",
    base = "#f8f1e9",
    surface = "#f0e9e0",
    overlay = "#e8e0d5",
    muted = "#877f6f",
    subtle = "#a39b89",
    text = "#403c32",
    love = "#8eb69b",
    gold = "#f6c177",
    rose = "#3eb489",
    pine = "#6a7fa8", -- darkened for contrast
    foam = "#9ccfd8",
    iris = "#429e9d",
    comment = "#31b32c",
    highlight_low = "#e8e0d5",
    highlight_med = "#d9d1c4",
    highlight_high = "#c9c1b5",
    none = "NONE",
  },
}

local function get_palette()
  return vim.o.background == "light" and variants.dawn or variants.main
end

function M.toggle()
  vim.o.background = (vim.o.background == "light") and "dark" or "light"
  M.load()
end

function M.load()
  local p = get_palette()

  local function hl(group, opts)
    opts = opts or {}
    vim.api.nvim_set_hl(0, group, opts)
  end

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
  vim.o.termguicolors = true
  vim.g.colors_name = "jblow"

  -- Core
  hl("Normal", { fg = p.text, bg = p.base })
  hl("NormalNC", { fg = p.text, bg = p.base })
  hl("NormalFloat", { fg = p.text, bg = p.surface })
  hl("Comment", { fg = p.comment })
  hl("CursorLine", { bg = p.overlay })
  hl("CursorLineNr", { fg = p.text })
  hl("LineNr", { fg = p.muted })
  hl("WinSeparator", { fg = p.muted })

  -- Syntax
  hl("String", { fg = p.rose })
  hl("Number", { fg = p.gold })
  hl("Boolean", { fg = p.gold })
  hl("Identifier", { fg = p.foam })
  hl("Function", { fg = p.rose })
  hl("Statement", { fg = p.pine })
  hl("Keyword", { fg = p.iris })
  hl("Operator", { fg = p.foam })
  hl("Type", { fg = p.foam })
  hl("Special", { fg = p.iris })

  -- UI elements
  hl("Visual", { bg = p.highlight_med })
  hl("Search", { fg = p.base, bg = p.gold })
  hl("IncSearch", { fg = p.base, bg = p.gold })
  hl("Pmenu", { fg = p.text, bg = p.surface })
  hl("PmenuSel", { fg = p.base, bg = p.rose })
  hl("StatusLine", { fg = p.text, bg = p.surface })
  hl("StatusLineNC", { fg = p.muted, bg = p.surface })

  -- Diagnostics & Git
  hl("DiagnosticError", { fg = "#eb6f92" })
  hl("DiagnosticWarn", { fg = p.gold })
  hl("DiagnosticInfo", { fg = p.foam })
  hl("DiagnosticHint", { fg = p.iris })
  hl("DiffAdd", { fg = p.foam, bg = "#2a3a2f" })
  hl("DiffDelete", { fg = "#eb6f92", bg = "#3a2a2f" })
  hl("DiffChange", { fg = p.gold, bg = "#3a3228" })

  -- Tree-sitter (modern syntax)
  hl("@keyword", { fg = p.iris })
  hl("@function", { fg = p.rose })
  hl("@method", { fg = p.rose })
  hl("@variable", { fg = p.text })
  hl("@string", { fg = p.rose })
  hl("@type", { fg = p.foam })
  hl("@parameter", { fg = p.foam, italic = true })

  -- Add more groups here if you need them (most common ones are covered)
end

-- Auto-load when the file is sourced
M.load()

return M
