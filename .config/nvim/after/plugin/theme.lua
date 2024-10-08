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
  color = color or "evergarden"
  vim.cmd.colorscheme(color)

  if overwrite_background then
    vim.api.nvim_set_hl(0, "Normal", { bg = "#090108" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end

  -- Change comment color to red
  vim.cmd('highlight Comment guifg=#bb4033')
  vim.cmd('highlight @comment guifg=#bb4033')

  -- Make Whitespace chars not obnoxiously bright
  vim.cmd('highlight Whitespace guifg=#302922')

  -- Make matching parens less noisy
  vim.cmd('highlight MatchParen guibg=#303030 guifg=#777777')

  -- Set background colour of long lines to dark red
  vim.cmd("call lengthmatters#highlight('guibg=#440000')")
end

Colorify(nil, true)
