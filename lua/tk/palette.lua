-- Tokyo Night palette by folke/tokyonight.nvim (Apache-2.0), jittered once per session.
local original = {
  bg = "#1a1b26",
  bg_dark = "#16161e",
  bg_highlight = "#292e42",
  terminal_black = "#414868",
  fg = "#c0caf5",
  fg_dark = "#a9b1d6",
  fg_gutter = "#3b4261",
  comment = "#565f89",
  white = "#FFFFFF",
  blue = "#7aa2f7",
  blue0 = "#3d59a1",
  blue1 = "#2ac3de",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#b4f9f8",
  blue7 = "#394b70",
  cyan = "#7dcfff",
  green = "#9ece6a",
  green1 = "#73daca",
  green2 = "#41a6b5",
  magenta = "#bb9af7",
  magenta2 = "#ff007c",
  orange = "#ff9e64",
  purple = "#9d7cd8",
  red = "#f7768e",
  red1 = "#db4b4b",
  teal = "#1abc9c",
  yellow = "#e0af68",
}

local clock = vim.uv or vim.loop
local seed = math.floor(clock.hrtime() % 2147483647)
if seed == 0 then seed = 1 end

local function random(max)
  local high = math.floor(seed / 44488)
  local low = seed % 44488
  seed = 48271 * low - 3399 * high
  if seed <= 0 then seed = seed + 2147483647 end
  return seed % max
end

local function jitter(hex)
  local channels = {}
  for value in hex:gmatch("%x%x") do
    local channel = tonumber(value, 16) + random(11) - 5
    channels[#channels + 1] = math.max(0, math.min(255, channel))
  end
  return string.format("#%02x%02x%02x", channels[1], channels[2], channels[3])
end

local palette = {}
for name, color in pairs(original) do palette[name] = jitter(color) end
return palette
