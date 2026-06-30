local M = {}

function M.setup(config)
  local c = require("tk.palette")
  local none = "NONE"
  local normal_bg = config.transparent and none or c.bg
  local comment_style = config.styles.comments or {}
  local keyword_style = config.styles.keywords or {}

  local g = {
    Normal = { fg = c.fg, bg = normal_bg },
    NormalNC = { fg = c.fg_dark, bg = normal_bg },
    NormalFloat = { fg = c.fg, bg = c.bg_dark },
    FloatBorder = { fg = c.blue0, bg = c.bg_dark },
    FloatTitle = { fg = c.blue, bg = c.bg_dark, bold = true },
    NonText = { fg = c.terminal_black }, EndOfBuffer = { fg = c.bg },
    Whitespace = { fg = c.fg_gutter }, LineNr = { fg = c.comment, bg = normal_bg },
    CursorLineNr = { fg = c.yellow, bg = normal_bg, bold = true },
    CursorLine = { bg = c.bg_highlight }, CursorColumn = { link = "CursorLine" },
    ColorColumn = { bg = c.bg_highlight }, SignColumn = { fg = c.blue, bg = normal_bg },
    CursorLineSign = { bg = c.bg_highlight }, FoldColumn = { fg = c.comment, bg = normal_bg },
    Folded = { fg = c.blue, bg = c.bg_highlight }, MatchParen = { fg = c.orange, bold = true },
    Visual = { bg = c.blue7 }, VisualNOS = { link = "Visual" },
    Search = { fg = c.bg, bg = c.blue }, IncSearch = { fg = c.bg, bg = c.orange },
    CurSearch = { fg = c.bg, bg = c.yellow, bold = true }, Substitute = { fg = c.bg, bg = c.red },
    Pmenu = { fg = c.fg, bg = c.bg_dark }, PmenuSel = { fg = c.fg, bg = c.blue7, bold = true },
    PmenuKind = { fg = c.cyan, bg = c.bg_dark }, PmenuExtra = { fg = c.comment, bg = c.bg_dark },
    PmenuSbar = { bg = c.bg_highlight }, PmenuThumb = { bg = c.fg_gutter },
    StatusLine = { fg = c.comment, bg = normal_bg }, StatusLineNC = { fg = c.comment, bg = normal_bg },
    TabLine = { fg = c.comment, bg = c.bg_dark }, TabLineFill = { bg = c.bg },
    TabLineSel = { fg = c.fg, bg = c.bg_highlight }, WinSeparator = { fg = c.fg_gutter },
    VertSplit = { link = "WinSeparator" }, Directory = { fg = c.blue }, Title = { fg = c.blue, bold = true },
    Question = { fg = c.cyan }, MoreMsg = { fg = c.green }, ModeMsg = { fg = c.yellow, bold = true },
    WarningMsg = { fg = c.orange }, ErrorMsg = { fg = c.red }, Error = { fg = c.red },
    Todo = { fg = c.bg, bg = c.yellow, bold = true },

    Comment = vim.tbl_extend("force", { fg = c.comment }, comment_style),
    SpecialComment = { fg = c.comment, bold = true }, Constant = { fg = c.orange },
    String = { fg = c.green }, Character = { fg = c.green1 }, Number = { fg = c.orange },
    Boolean = { fg = c.orange, bold = true }, Float = { link = "Number" }, Identifier = { fg = c.magenta },
    Function = { fg = c.blue }, Statement = vim.tbl_extend("force", { fg = c.magenta, bold = true }, keyword_style),
    Keyword = vim.tbl_extend("force", { fg = c.purple }, keyword_style), Operator = { fg = c.blue5 },
    Exception = { fg = c.magenta }, PreProc = { fg = c.cyan }, Type = { fg = c.blue1 },
    Special = { fg = c.blue5 }, Delimiter = { fg = c.blue5 }, Underlined = { fg = c.blue, underline = true },

    DiffAdd = { bg = c.blue7 }, DiffChange = { bg = c.bg_highlight },
    DiffDelete = { fg = c.red1, bg = c.bg_dark }, DiffText = { bg = c.blue0, bold = true },
    Added = { fg = c.green }, Changed = { fg = c.yellow }, Removed = { fg = c.red },
    DiagnosticError = { fg = c.red }, DiagnosticWarn = { fg = c.yellow },
    DiagnosticInfo = { fg = c.blue1 }, DiagnosticHint = { fg = c.teal }, DiagnosticOk = { fg = c.green },
    DiagnosticUnderlineError = { sp = c.red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = c.yellow, undercurl = true },
    DiagnosticUnderlineInfo = { sp = c.blue1, undercurl = true },
    DiagnosticUnderlineHint = { sp = c.teal, undercurl = true },
    LspReferenceText = { bg = c.bg_highlight }, LspReferenceRead = { link = "LspReferenceText" },
    LspReferenceWrite = { bg = c.bg_highlight, underline = true },
    LspSignatureActiveParameter = { fg = c.orange, bold = true }, LspCodeLens = { fg = c.comment },

    ["@comment"] = { link = "Comment" }, ["@comment.documentation"] = { link = "SpecialComment" },
    ["@string"] = { link = "String" }, ["@string.escape"] = { fg = c.magenta },
    ["@character"] = { link = "Character" }, ["@number"] = { link = "Number" },
    ["@boolean"] = { link = "Boolean" }, ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = c.orange, bold = true }, ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.red, italic = true }, ["@variable.parameter"] = { fg = c.yellow },
    ["@function"] = { link = "Function" }, ["@function.builtin"] = { fg = c.cyan },
    ["@function.call"] = { link = "Function" }, ["@method"] = { link = "Function" },
    ["@constructor"] = { fg = c.blue1 }, ["@keyword"] = { link = "Keyword" },
    ["@keyword.function"] = { fg = c.magenta }, ["@keyword.return"] = { fg = c.magenta },
    ["@operator"] = { link = "Operator" }, ["@type"] = { link = "Type" },
    ["@type.builtin"] = { fg = c.blue1, italic = true }, ["@property"] = { fg = c.green1 },
    ["@attribute"] = { fg = c.yellow }, ["@tag"] = { fg = c.red },
    ["@tag.attribute"] = { fg = c.yellow }, ["@tag.delimiter"] = { fg = c.blue5 },
    ["@markup.heading"] = { link = "Title" }, ["@markup.link"] = { fg = c.blue, underline = true },
    ["@markup.raw"] = { link = "String" },

    GitSignsAdd = { fg = c.green }, GitSignsChange = { fg = c.yellow }, GitSignsDelete = { fg = c.red },
    TelescopeBorder = { fg = c.blue0 }, TelescopeSelection = { bg = c.bg_highlight, bold = true },
    TelescopeMatching = { fg = c.orange, bold = true }, BlinkCmpLabelMatch = { fg = c.blue, bold = true },
    CmpItemAbbrMatch = { fg = c.blue, bold = true }, CmpItemAbbrMatchFuzzy = { fg = c.cyan, bold = true },
  }

  local links = {
    Conditional = "Statement", Repeat = "Statement", Label = "Statement",
    Include = "PreProc", Define = "PreProc", Macro = "PreProc", PreCondit = "PreProc",
    StorageClass = "Type", Structure = "Type", Typedef = "Type", Debug = "Special",
    SpecialChar = "Special", Tag = "Special", Terminal = "Normal", QuickFixLine = "Search",
    SpellBad = "DiagnosticUnderlineError", SpellCap = "DiagnosticUnderlineWarn",
    SpellLocal = "DiagnosticUnderlineInfo", SpellRare = "DiagnosticUnderlineHint",
  }
  for name, target in pairs(links) do g[name] = { link = target } end
  return g
end

return M
