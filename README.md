# tk.nvim

A self-contained Neovim colorscheme based on the Night palette from
[tokyonight.nvim](https://github.com/folke/tokyonight.nvim). Every palette color
is varied once per Neovim session by up to 5 RGB levels per channel (about 2%).

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "andrewgilley/tk.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tk").setup({
      transparent = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    })

    vim.cmd.colorscheme("tk")
  end,
}
```

The `setup` call is optional.

## Features

- Tokyo Night palette with subtle per-session variation
- Tree-sitter and semantic syntax highlighting
- LSP diagnostics and references
- GitSigns, Telescope, blink.cmp, and nvim-cmp highlights
- Matching Neovim terminal colors
- Optional transparent background

Tokyo Night is created by [folke](https://github.com/folke) and distributed
under the Apache License 2.0.
