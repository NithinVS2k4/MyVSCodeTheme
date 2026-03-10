-- =============================================================================
-- Vesper (Custom) — Neovim colorscheme
-- =============================================================================
-- Based on the Vesper VSCode theme by Rauno Freiberg
-- https://github.com/raunofreiberg/vesper
--
-- User modifications:
--   strings:              #6dd9ba  (original: #99FFE4)
--   keywords:             #7cabde  (original: #A0A0A0)
--   logical operators:    #7cabde
--   constant.language:    #7cabde  (original: #FFC799)
--   self / cls:           #bfbfbf  (original: #A0A0A0)
--
-- =============================================================================
-- INSTALLATION  (complete beginner steps)
-- =============================================================================
--
-- 1. Find your Neovim config folder. In a terminal run:
--      echo $HOME/.config/nvim
--    That folder is your nvim config root. If it doesn't exist yet:
--      mkdir -p ~/.config/nvim/colors
--
-- 2. Create the colors folder if it doesn't exist:
--      mkdir -p ~/.config/nvim/colors
--
-- 3. Copy this file there:
--      cp vesper-custom.lua ~/.config/nvim/colors/vesper-custom.lua
--
-- 4. Tell Neovim to use it. Open (or create) ~/.config/nvim/init.lua and add:
--      vim.cmd("colorscheme vesper-custom")
--    If you have init.vim instead, add:
--      colorscheme vesper-custom
--
-- 5. Restart Neovim (or run :colorscheme vesper-custom in command mode).
--
-- That's it. Treesitter highlighting (the richer kind) works automatically
-- if you have nvim-treesitter installed. If you don't, the traditional
-- highlight groups below still cover everything.
-- =============================================================================

vim.o.background = "dark"
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "vesper-custom"

-- ---------------------------------------------------------------------------
-- Palette
-- ---------------------------------------------------------------------------
local c = {
  bg        = "#101010",  -- editor background
  fg        = "#ffffff",  -- default text
  orange    = "#FFC799",  -- functions, classes, numbers, tags, JSON keys
  string    = "#6dd9ba",  -- strings  (user override; original #99FFE4)
  keyword   = "#7cabde",  -- keywords, logical ops, constant.language  (user override; original #A0A0A0)
  self_var  = "#bfbfbf",  -- self / cls  (user override; original #A0A0A0)
  gray      = "#A0A0A0",  -- attributes, misc punctuation, language vars (this/super)
  comment   = "#8b8b8b",  -- comments  (original has ~58% alpha; opaque approx)
  red       = "#FF8080",  -- errors, invalid, deleted
  warning   = "#FFC799",  -- warnings reuse orange
  selection = "#ffffff25",-- selection bg  (semi-transparent — used as solid approx below)
  sel_solid = "#2a2a2a",  -- solid approximation of #ffffff25 on #101010
  line_hl   = "#181818",  -- current line
  gutter_fg = "#505050",  -- line number fg
  bracket   = "#2a2a2a",  -- bracket match bg
  invisible = "#2e2e2e",  -- whitespace / right margin
}

-- ---------------------------------------------------------------------------
-- Helper
-- ---------------------------------------------------------------------------
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ===========================================================================
-- EDITOR CHROME
-- ===========================================================================

hi("Normal",          { fg = c.fg,       bg = c.bg })
hi("NormalFloat",     { fg = c.fg,       bg = "#161616" })
hi("FloatBorder",     { fg = "#282828",  bg = "#161616" })
hi("Visual",          { bg = c.sel_solid })
hi("Search",          { fg = c.bg,       bg = c.orange })
hi("IncSearch",       { fg = c.bg,       bg = c.orange })
hi("CurSearch",       { fg = c.bg,       bg = c.orange })
hi("CursorLine",      { bg = c.line_hl })
hi("CursorColumn",    { bg = c.line_hl })
hi("ColorColumn",     { bg = c.line_hl })
hi("LineNr",          { fg = c.gutter_fg, bg = c.bg })
hi("CursorLineNr",    { fg = c.fg,       bg = c.bg,    bold = true })
hi("SignColumn",      { fg = c.gutter_fg, bg = c.bg })
hi("MatchParen",      { bg = c.bracket,  bold = true })
hi("NonText",         { fg = c.invisible })
hi("SpecialKey",      { fg = c.invisible })
hi("Whitespace",      { fg = c.invisible })
hi("EndOfBuffer",     { fg = c.gutter_fg })
hi("Folded",          { fg = c.comment,  bg = c.line_hl })
hi("FoldColumn",      { fg = c.gutter_fg, bg = c.bg })
hi("StatusLine",      { fg = c.gray,     bg = "#101010" })
hi("StatusLineNC",    { fg = "#707070",  bg = "#101010" })
hi("TabLine",         { fg = c.gray,     bg = "#101010" })
hi("TabLineSel",      { fg = c.fg,       bg = "#161616" })
hi("TabLineFill",     { bg = "#101010" })
hi("VertSplit",       { fg = "#282828",  bg = c.bg })
hi("WinSeparator",    { fg = "#282828",  bg = c.bg })
hi("Pmenu",           { fg = c.fg,       bg = "#1c1c1c" })
hi("PmenuSel",        { fg = c.fg,       bg = "#2a2a2a" })
hi("PmenuSbar",       { bg = "#1c1c1c" })
hi("PmenuThumb",      { bg = "#343434" })
hi("WildMenu",        { fg = c.bg,       bg = c.orange })

-- ===========================================================================
-- DIAGNOSTICS
-- ===========================================================================

hi("DiagnosticError",          { fg = c.red })
hi("DiagnosticWarn",           { fg = c.warning })
hi("DiagnosticInfo",           { fg = c.keyword })
hi("DiagnosticHint",           { fg = c.gray })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.warning })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.keyword })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.gray })

-- ===========================================================================
-- GIT / DIFF SIGNS  (matches editorGutter colors in original theme)
-- ===========================================================================

hi("DiffAdd",    { fg = "#99FFE4", bg = "#99FFE415" })  -- original gutter added
hi("DiffDelete", { fg = c.red,     bg = "#FF808015" })
hi("DiffChange", { fg = c.warning, bg = "#FFC79915" })
hi("DiffText",   { fg = c.warning, bold = true })

-- Sign column git indicators (GitSigns, etc.)
hi("GitSignsAdd",    { fg = "#99FFE4", bg = c.bg })
hi("GitSignsChange", { fg = c.warning, bg = c.bg })
hi("GitSignsDelete", { fg = c.red,     bg = c.bg })

-- ===========================================================================
-- TRADITIONAL VIM SYNTAX GROUPS
-- These work for every language even without Treesitter.
-- ===========================================================================

-- Comments — "comment", "punctuation.definition.comment" → #8b8b8b (italic)
hi("Comment",        { fg = c.comment, italic = true })
hi("SpecialComment", { fg = c.comment, italic = true })

-- Strings — user: #6dd9ba
hi("String",         { fg = c.string })
hi("Character",      { fg = c.string })

-- Constants:
--   constant.language (True/False/None/null) → user: #7cabde
--   constant.numeric / keyword.other.unit    → #FFC799
hi("Constant",       { fg = c.keyword })  -- covers constant.language
hi("Boolean",        { fg = c.keyword })  -- True / False / None
hi("Number",         { fg = c.orange })
hi("Float",          { fg = c.orange })

-- Keywords — user: #7cabde
hi("Keyword",        { fg = c.keyword })
hi("Statement",      { fg = c.keyword })
hi("Conditional",    { fg = c.keyword })  -- if / else / elif
hi("Repeat",         { fg = c.keyword })  -- for / while
hi("Label",          { fg = c.keyword })  -- case / default
hi("Exception",      { fg = c.keyword })  -- try / except / raise
hi("PreProc",        { fg = c.keyword })  -- #include / import
hi("Include",        { fg = c.keyword })
hi("Define",         { fg = c.keyword })
hi("Macro",          { fg = c.orange })
hi("PreCondit",      { fg = c.keyword })
hi("StorageClass",   { fg = c.keyword })  -- storage.modifier
hi("Structure",      { fg = c.orange })   -- struct / class keyword → type color
hi("Typedef",        { fg = c.orange })

-- Operators — keyword.operator.logical → user: #7cabde
hi("Operator",       { fg = c.keyword })

-- Types / Classes — entity.name, support.type, support.class → #FFC799
hi("Type",           { fg = c.orange })

-- Functions — entity.name.function, support.function → #FFC799
hi("Function",       { fg = c.orange })

-- Variables — default text
hi("Identifier",     { fg = c.fg })

-- Special — escape chars, format specifiers → #A0A0A0
hi("Special",        { fg = c.gray })
hi("SpecialChar",    { fg = c.gray })
hi("Delimiter",      { fg = c.gray })  -- brackets, commas, semicolons
hi("Tag",            { fg = c.orange })

-- Errors / invalid
hi("Error",          { fg = c.red })
hi("ErrorMsg",       { fg = c.red })
hi("WarningMsg",     { fg = c.warning })

-- Underline for URLs
hi("Underlined",     { fg = c.string, underline = true })

-- Markup (Markdown via vim syntax)
hi("Title",          { fg = c.orange, bold = true })  -- headings
hi("Bold",           { bold = true })
hi("Italic",         { italic = true })

-- ===========================================================================
-- TREESITTER HIGHLIGHT GROUPS  (@xxx)
-- These take over from traditional groups when nvim-treesitter is installed.
-- They follow TextMate scope logic much more closely.
-- ===========================================================================

-- ── Literals ──────────────────────────────────────────────────────────────

hi("@string",                 { fg = c.string })   -- "string" scope
hi("@string.escape",          { fg = c.gray })     -- constant.character.escape → #A0A0A0
hi("@string.special",         { fg = c.gray })
hi("@string.regex",           { fg = c.gray })     -- string.regexp → #A0A0A0
hi("@character",              { fg = c.string })
hi("@number",                 { fg = c.orange })   -- constant.numeric → #FFC799
hi("@float",                  { fg = c.orange })
-- constant.language (True/False/None/null/undefined) → user: #7cabde
hi("@boolean",                { fg = c.keyword })
hi("@constant",               { fg = c.keyword })  -- general constants → keyword color
hi("@constant.builtin",       { fg = c.keyword })  -- None, true, false, null → #7cabde
hi("@constant.macro",         { fg = c.orange })

-- ── Comments ──────────────────────────────────────────────────────────────

hi("@comment",                { fg = c.comment, italic = true })
hi("@comment.documentation",  { fg = c.comment, italic = true })

-- ── Keywords ──────────────────────────────────────────────────────────────
-- "keyword", "storage.type", "storage.modifier", "keyword.control" → user: #7cabde

hi("@keyword",                { fg = c.keyword })
hi("@keyword.function",       { fg = c.keyword })   -- def / function keyword
hi("@keyword.operator",       { fg = c.keyword })   -- keyword.operator.logical (and/or/not) → user: #7cabde
hi("@keyword.return",         { fg = c.keyword })
hi("@keyword.import",         { fg = c.keyword })
hi("@keyword.conditional",    { fg = c.keyword })
hi("@keyword.repeat",         { fg = c.keyword })
hi("@keyword.exception",      { fg = c.keyword })
hi("@keyword.modifier",       { fg = c.keyword })   -- storage.modifier (async, static, etc.)
hi("@keyword.coroutine",      { fg = c.keyword })
hi("@operator",               { fg = c.keyword })   -- keyword.operator.logical → #7cabde
hi("@punctuation.delimiter",  { fg = c.gray })
hi("@punctuation.bracket",    { fg = c.gray })
hi("@punctuation.special",    { fg = c.gray })

-- ── Functions ─────────────────────────────────────────────────────────────
-- "entity.name.function", "variable.function", "support.function" → #FFC799

hi("@function",               { fg = c.orange })
hi("@function.builtin",       { fg = c.orange })    -- support.function
hi("@function.call",          { fg = c.orange })
hi("@function.method",        { fg = c.orange })
hi("@function.method.call",   { fg = c.orange })
hi("@constructor",            { fg = c.orange })
hi("@method",                 { fg = c.orange })    -- alias kept for older treesitter
hi("@method.call",            { fg = c.orange })

-- ── Types / Classes ───────────────────────────────────────────────────────
-- "entity.name", "support.type", "support.class" → #FFC799

hi("@type",                   { fg = c.orange })
hi("@type.builtin",           { fg = c.orange })
hi("@type.qualifier",         { fg = c.keyword })   -- const/let qualifiers
hi("@type.definition",        { fg = c.orange })
hi("@class",                  { fg = c.orange })
hi("@namespace",              { fg = c.orange })
hi("@module",                 { fg = c.orange })

-- ── Variables / Identifiers ───────────────────────────────────────────────
-- "variable", "meta.block variable.other" → #FFF

hi("@variable",               { fg = c.fg })
hi("@variable.builtin",       { fg = c.gray })      -- this/super → original #A0A0A0 (language vars)
hi("@variable.parameter",     { fg = c.fg })
hi("@variable.member",        { fg = c.fg })        -- object properties
hi("@field",                  { fg = c.fg })        -- alias kept for older treesitter
hi("@property",               { fg = c.fg })

-- ── Python-specific: self / cls ───────────────────────────────────────────
-- "variable.language.special.self.python" → user: #bfbfbf

hi("@variable.builtin.python", { fg = c.self_var }) -- covers self, cls

-- ── Tags (HTML/JSX/XML) ───────────────────────────────────────────────────
-- "entity.name.tag" → #FFC799
-- "entity.other.attribute-name" → #A0A0A0
-- "text.html.basic entity.other.attribute-name" → #FFC799

hi("@tag",                    { fg = c.orange })
hi("@tag.builtin",            { fg = c.orange })
hi("@tag.attribute",          { fg = c.gray })      -- generic attribute name
hi("@tag.delimiter",          { fg = c.gray })

-- ── Markup / Markdown ─────────────────────────────────────────────────────

hi("@markup.heading",         { fg = c.orange, bold = true })  -- markup.heading → #FFC799
hi("@markup.strong",          { bold = true })
hi("@markup.italic",          { italic = true })
hi("@markup.underline",       { fg = c.orange, underline = true })
hi("@markup.strikethrough",   { fg = c.red,   strikethrough = true })
hi("@markup.raw",             { fg = c.gray })                 -- markup.raw.block → #A0A0A0
hi("@markup.link",            { fg = c.string, underline = true })
hi("@markup.link.url",        { fg = c.gray,   underline = true })
hi("@markup.link.label",      { fg = c.gray })
hi("@markup.list",            { fg = c.keyword })

-- ── Misc ──────────────────────────────────────────────────────────────────

hi("@error",                  { fg = c.red })
hi("@none",                   {})
hi("@conceal",                { fg = c.comment })

-- ===========================================================================
-- LANGUAGE-SPECIFIC OVERRIDES (Treesitter)
-- ===========================================================================

-- ── Python ─────────────────────────────────────────────────────────────────
-- self/cls via @variable.builtin already set above.
-- Decorators → #FFC799 ("entity.name.function" family)
hi("@attribute.python",       { fg = c.orange })  -- decorators

-- ── JavaScript / TypeScript ────────────────────────────────────────────────
-- "variable.language" (this) → #A0A0A0  (covered by @variable.builtin)
-- Template literals → string color
hi("@string.special.url.javascript", { fg = c.string, underline = true })

-- ── JSON ───────────────────────────────────────────────────────────────────
-- All JSON key levels → #FFC799
hi("@property.json",          { fg = c.orange })

-- ── CSS ────────────────────────────────────────────────────────────────────
-- "source.css support.type.property-name" → #FFF
hi("@property.css",           { fg = c.fg })
hi("@type.css",               { fg = c.orange })   -- class / id selectors → #FFC799
hi("@string.css",             { fg = c.string })
hi("@number.css",             { fg = c.orange })

-- ── Diff ───────────────────────────────────────────────────────────────────
-- Already covered by DiffAdd/DiffDelete/DiffChange above.
hi("@diff.plus",              { fg = "#99FFE4" })
hi("@diff.minus",             { fg = c.red })
hi("@diff.delta",             { fg = c.gray })

-- ===========================================================================
-- LSP SEMANTIC TOKEN HIGHLIGHTS
-- These are emitted by language servers and override treesitter where present.
-- ===========================================================================

hi("@lsp.type.class",         { fg = c.orange })
hi("@lsp.type.enum",          { fg = c.orange })
hi("@lsp.type.enumMember",    { fg = c.orange })
hi("@lsp.type.interface",     { fg = c.orange })
hi("@lsp.type.struct",        { fg = c.orange })
hi("@lsp.type.type",          { fg = c.orange })
hi("@lsp.type.typeParameter", { fg = c.orange })
hi("@lsp.type.function",      { fg = c.orange })
hi("@lsp.type.method",        { fg = c.orange })
hi("@lsp.type.namespace",     { fg = c.orange })
hi("@lsp.type.module",        { fg = c.orange })
hi("@lsp.type.variable",      { fg = c.fg })
hi("@lsp.type.parameter",     { fg = c.fg })
hi("@lsp.type.property",      { fg = c.fg })
hi("@lsp.type.keyword",       { fg = c.keyword })
hi("@lsp.type.comment",       { fg = c.comment, italic = true })
hi("@lsp.type.string",        { fg = c.string })
hi("@lsp.type.number",        { fg = c.orange })
hi("@lsp.type.boolean",       { fg = c.keyword })
hi("@lsp.type.operator",      { fg = c.keyword })
hi("@lsp.type.decorator",     { fg = c.orange })
-- Python self/cls from LSP
hi("@lsp.type.selfParameter", { fg = c.self_var })
hi("@lsp.type.clsParameter",  { fg = c.self_var })

-- Modifiers (combine with base type)
hi("@lsp.mod.readonly",       { fg = c.keyword })
hi("@lsp.mod.defaultLibrary", { fg = c.orange })
hi("@lsp.mod.builtin",        { fg = c.orange })
