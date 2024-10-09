local ll = require("lualine")

ll.setup {
  options = {
    icons_enabled = true,
    theme = 'vscode',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

function Colorify(color, overwrite_background)
  local defaultColor = 'evergarden'
  local defaultBg = '#090108'
  local ft = vim.bo.filetype

  if ft == 'cs' then
    defaultColor = 'vscode'
    defaultBg = '#070210'
  elseif ft == 'go' then
    defaultColor = 'kanagawa'
    defaultBg = '#10292d'
  elseif ft == 'zig' then
    defaultColor = 'evergarden'
    defaultBg = '#150508'
  elseif ft == 'lua' then
    defaultColor = 'habamax'
    defaultBg = '#151515'
  elseif ft == 'oil' then
    defaultColor = 'gruvbox'
    defaultBg = '#151515'
  end

  color = color or defaultColor
  vim.cmd.colorscheme(color)

  if overwrite_background then
    vim.api.nvim_set_hl(0, "Normal", { bg = defaultBg })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end

  -- Change comment color to red
  vim.cmd('highlight Comment guifg=#bb4033')
  vim.cmd('highlight @comment guifg=#bb4033')

  -- Make Whitespace chars not obnoxiously bright
  vim.cmd('highlight Whitespace guifg=#302922')

  -- Make matching parens less noisy
  vim.cmd('highlight MatchParen guibg=#303030 guifg=#777777')

  -- Diagnostic hint underlines should be more aggressive
  vim.cmd("highlight DiagnosticUnderlineHint guisp=#cf9417")
  vim.cmd("highlight DiagnosticHint guifg=#cf9417")

  -- Set background colour of long lines to dark red
  vim.cmd("call lengthmatters#highlight('guibg=#440000')")
end

Colorify(nil, true)

local color_group = vim.api.nvim_create_augroup('Colourify', {clear = true})
vim.api.nvim_create_autocmd('BufEnter', {
  group = color_group,
  pattern = '*',
  callback = function ()
    local ft = vim.bo.filetype
    if ft == 'oil' then
      -- Running the color function from an autocmd borks oil colours
      return
    end
    Colorify(nil, true)
  end

});
