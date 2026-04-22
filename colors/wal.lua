local f = io.open(vim.fn.expand("~/.cache/wal/colors.json"), "r")
if not f then return end
local ok, data = pcall(vim.json.decode, f:read("*a"))
f:close()
if not ok then return end

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.g.colors_name = "wal"

local c = data.colors
local s = data.special

-- HSL utilities to derive accent colors from the pywal palette
local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16) / 255,
         tonumber(hex:sub(3, 4), 16) / 255,
         tonumber(hex:sub(5, 6), 16) / 255
end

local function rgb_to_hsl(r, g, b)
  local max, min = math.max(r, g, b), math.min(r, g, b)
  local h, sat, l = 0, 0, (max + min) / 2
  if max ~= min then
    local d = max - min
    sat = l > 0.5 and d / (2 - max - min) or d / (max + min)
    if max == r then h = (g - b) / d + (g < b and 6 or 0)
    elseif max == g then h = (b - r) / d + 2
    else h = (r - g) / d + 4 end
    h = h / 6
  end
  return h * 360, sat, l
end

local function hsl_to_rgb(h, sat, l)
  h = h / 360
  if sat == 0 then return l, l, l end
  local function hue2rgb(p, q, t)
    if t < 0 then t = t + 1 end
    if t > 1 then t = t - 1 end
    if t < 1/6 then return p + (q - p) * 6 * t end
    if t < 1/2 then return q end
    if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
    return p
  end
  local q = l < 0.5 and l * (1 + sat) or l + sat - l * sat
  local p = 2 * l - q
  return hue2rgb(p, q, h + 1/3), hue2rgb(p, q, h), hue2rgb(p, q, h - 1/3)
end

local function rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x",
    math.floor(r * 255 + 0.5),
    math.floor(g * 255 + 0.5),
    math.floor(b * 255 + 0.5))
end

-- Lighten a hex color by boosting its HSL lightness
local function lighten(hex, amount)
  local h, sat, l = rgb_to_hsl(hex_to_rgb(hex))
  return rgb_to_hex(hsl_to_rgb(h, sat, math.min(l + amount, 1)))
end

-- All accents derived from the actual pywal palette.
-- color8 is the only color with real hue (purple-gray); used as the main accent.
-- color1-color6 provide lightness steps for the rest.
local a = {
  keyword  = lighten(c.color8, 0.22),  -- color8 brightened: distinctive purple
  func     = c.color6,                 -- lightest gray: stands out
  string   = c.color4,                 -- mid-light gray
  type     = c.color5,                 -- lighter gray
  number   = c.color3,                 -- mid gray
  builtin  = c.color2,                 -- slightly darker gray
  comment  = c.color8,                 -- color8 as-is: muted, recedes
}

local function hi(group, fg, bg, attrs)
  local t = {}
  if fg then t.fg = fg end
  if bg then t.bg = bg end
  if attrs then t[attrs] = true end
  vim.api.nvim_set_hl(0, group, t)
end

-- Base UI
hi("Normal",          s.foreground, s.background)
hi("NormalFloat",     s.foreground, s.background)
hi("NormalNC",        s.foreground, s.background)
hi("Comment",         a.comment)
hi("Keyword",         a.keyword)
hi("Function",        a.func)
hi("String",          a.string)
hi("Number",          a.number)
hi("Float",           a.number)
hi("Boolean",         a.builtin)
hi("Type",            a.type)
hi("Constant",        a.number)
hi("Identifier",      s.foreground)
hi("Statement",       a.keyword)
hi("PreProc",         a.type)
hi("Special",         a.builtin)
hi("Delimiter",       c.color7)
hi("Operator",        s.foreground)
hi("Underlined",      a.func, nil, "underline")
hi("Error",           s.foreground, c.color1)
hi("Todo",            c.color0, a.string)
hi("LineNr",          c.color8)
hi("CursorLineNr",    c.color7)
hi("CursorLine",      nil, c.color0)
hi("CursorColumn",    nil, c.color0)
hi("ColorColumn",     nil, c.color0)
hi("SignColumn",      nil, s.background)
hi("FoldColumn",      c.color7)
hi("Folded",          c.color8)
hi("NonText",         c.color0)
hi("SpecialKey",      c.color8)
hi("Visual",          c.color0, c.color7)
hi("Search",          c.color0, a.type)
hi("IncSearch",       c.color0, a.func)
hi("MatchParen",      c.color0, a.keyword)
hi("Pmenu",           s.foreground, c.color8)
hi("PmenuSel",        c.color0, a.func)
hi("PmenuSbar",       nil, c.color6)
hi("PmenuThumb",      nil, c.color8)
hi("StatusLine",      c.color0, c.color7)
hi("StatusLineNC",    c.color0, c.color8)
hi("WinSeparator",    c.color8)
hi("VertSplit",       c.color8)
hi("TabLine",         c.color8, s.background)
hi("TabLineFill",     c.color8, s.background)
hi("TabLineSel",      c.color0, a.builtin)
hi("Title",           a.func)
hi("Directory",       a.builtin)
hi("DiffAdd",         a.number)
hi("DiffDelete",      a.string)
hi("DiffChange",      c.color8)
hi("DiffText",        a.func)
hi("ErrorMsg",        a.string)
hi("WarningMsg",      a.type)
hi("ModeMsg",         a.number)
hi("Question",        a.builtin)
hi("FloatBorder",     c.color8)
hi("WildMenu",        c.color0, a.number)
hi("SpellBad",        a.string, nil, "undercurl")
hi("SpellCap",        a.builtin, nil, "undercurl")

-- Treesitter
hi("@variable",              s.foreground)
hi("@variable.builtin",      a.builtin)
hi("@variable.parameter",    s.foreground)
hi("@variable.member",       s.foreground)
hi("@keyword",               a.keyword)
hi("@keyword.return",        a.keyword)
hi("@keyword.function",      a.keyword)
hi("@keyword.operator",      a.keyword)
hi("@keyword.import",        a.type)
hi("@keyword.conditional",   a.keyword)
hi("@keyword.repeat",        a.keyword)
hi("@function",              a.func)
hi("@function.builtin",      a.builtin)
hi("@function.call",         a.func)
hi("@function.method",       a.func)
hi("@function.method.call",  a.func)
hi("@constructor",           a.type)
hi("@string",                a.string)
hi("@string.escape",         a.builtin)
hi("@string.special",        a.builtin)
hi("@number",                a.number)
hi("@number.float",          a.number)
hi("@boolean",               a.builtin)
hi("@type",                  a.type)
hi("@type.builtin",          a.type)
hi("@type.definition",       a.type)
hi("@constant",              a.number)
hi("@constant.builtin",      a.builtin)
hi("@constant.macro",        a.builtin)
hi("@comment",               a.comment)
hi("@operator",              s.foreground)
hi("@punctuation",           c.color7)
hi("@punctuation.bracket",   c.color7)
hi("@punctuation.delimiter", c.color7)
hi("@punctuation.special",   a.builtin)
hi("@tag",                   a.keyword)
hi("@tag.attribute",         a.type)
hi("@tag.delimiter",         c.color7)
hi("@attribute",             a.type)
hi("@namespace",             a.builtin)
hi("@module",                a.builtin)
hi("@label",                 a.func)

-- Diagnostic
hi("DiagnosticError",        a.string)
hi("DiagnosticWarn",         a.type)
hi("DiagnosticInfo",         a.builtin)
hi("DiagnosticHint",         a.number)
