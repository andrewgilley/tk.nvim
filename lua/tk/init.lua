local M = {}

M.config = {
  transparent = false,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
  },
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "tk"

  for group, opts in pairs(require("tk.groups").setup(M.config)) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  local c = require("tk.palette")
  local terminal = {
    c.bg_dark, c.red, c.green, c.yellow, c.blue, c.magenta, c.cyan, c.fg_dark,
    c.terminal_black, c.red1, c.green1, c.orange, c.blue5, c.purple, c.blue6, c.fg,
  }
  for i, color in ipairs(terminal) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

return M
