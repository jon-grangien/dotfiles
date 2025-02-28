local theme_helpers = {}

ThemeHelpersColorSchemeIndex = 1

local function print_theme_collection_legend()
  vim.api.nvim_set_hl(0, 'ThemeSelected', { fg = 'red', bg = 'NONE', bold = true })
  local marker = '* '

  local theme_names_in_order = {
    'Gruvbox',
    'Papercolor',
    'Tokyonight',
    'Tokyonight-day',
    'Kanagawa',
    'Kanagawa lotus',
    'Kanagawa dragon',
    'Catppuccin',
    'Catppuccin mocha',
    'Oxocarbon dark',
    'Oxocarbon light',
  }

  local chunks = {}

  for index, name in ipairs(theme_names_in_order) do
    local index_part = string.format('%d ', index)
    table.insert(chunks, { index_part, 'Normal' })

    if ThemeHelpersColorSchemeIndex == index then
      table.insert(chunks, { marker .. name, 'ThemeSelected' })
    else
      table.insert(chunks, { name, 'Normal' })
    end

    table.insert(chunks, { '\n', 'Normal' })
  end

  vim.api.nvim_echo(chunks, false, {})
end

local function set_snacks_highlight_groups(dir_color, file_color, match_color)
  vim.api.nvim_set_hl(0, 'SnacksPickerDir', { fg = dir_color })
  vim.api.nvim_set_hl(0, 'SnacksPickerFile', { fg = file_color })
  vim.api.nvim_set_hl(0, 'SnacksPickerMatch', { fg = match_color })
end

local function set_gruvbox_theme()
  vim.o.background = 'dark'
  vim.g['gruvbox_italic'] = 1
  vim.cmd('colorscheme gruvbox')

  set_snacks_highlight_groups('#e6e6e6', '#b3ff66', '#ffb366')
end

local function set_papercolor_theme()
  vim.o.background = 'light'
  vim.cmd('colorscheme Papercolor')

  -- todo lite
  set_snacks_highlight_groups('#bbbbbb', '#1a8cff', '#ff7733')
end

local function set_tokyonight_theme()
  vim.o.background = 'dark'
  vim.cmd('colorscheme tokyonight-night')
end

local function set_tokyoday_theme()
  vim.o.background = 'light'
  vim.cmd('colorscheme tokyonight-day')
end

local function set_kanagawa_light_theme()
  vim.o.background = 'light'
  vim.cmd('colorscheme kanagawa')
end

local function set_kanagawa_lotus_theme()
  vim.o.background = 'dark'
  vim.cmd('colorscheme kanagawa')
end

local function set_kanagawa_dragon_theme()
  vim.o.background = 'dark'
  vim.cmd('colorscheme kanagawa-dragon')
end

local function set_catppuccin_light_theme()
  vim.o.background = 'light'
  vim.cmd('colorscheme catppuccin')
end

local function set_catppuccin_dark_theme()
  vim.o.background = 'dark'
  vim.cmd('colorscheme catppuccin-mocha')
end

local function set_oxocarbon_dark_theme()
  vim.o.background = 'dark'
  vim.cmd('colorscheme oxocarbon')

  set_snacks_highlight_groups('#bbbbbb', '#ff66cc', '#3399ff')
end

local function set_oxocarbon_light_theme()
  vim.o.background = 'light'
  vim.cmd('colorscheme oxocarbon')

  set_snacks_highlight_groups('#000000', '#ff66cc', '#3399ff')
end

function theme_helpers.set_default_colorscheme()
  set_gruvbox_theme()
  ThemeHelpersColorSchemeIndex = 1
end

function theme_helpers.flip_to_next_colorscheme()
  -- Set theme index explicitly if range was supplied, otherwise increment to next theme
  ThemeHelpersColorSchemeIndex = (vim.v.count > 0) and vim.v.count or ThemeHelpersColorSchemeIndex + 1

  if ThemeHelpersColorSchemeIndex == 2 then
    set_papercolor_theme()
  elseif ThemeHelpersColorSchemeIndex == 3 then
    set_tokyonight_theme()
  elseif ThemeHelpersColorSchemeIndex == 4 then
    set_tokyoday_theme()
  elseif ThemeHelpersColorSchemeIndex == 5 then
    set_kanagawa_light_theme()
  elseif ThemeHelpersColorSchemeIndex == 6 then
    set_kanagawa_lotus_theme()
  elseif ThemeHelpersColorSchemeIndex == 7 then
    set_kanagawa_dragon_theme()
  elseif ThemeHelpersColorSchemeIndex == 8 then
    set_catppuccin_light_theme()
  elseif ThemeHelpersColorSchemeIndex == 9 then
    set_catppuccin_dark_theme()
  elseif ThemeHelpersColorSchemeIndex == 10 then
    set_oxocarbon_dark_theme()
  elseif ThemeHelpersColorSchemeIndex == 11 then
    set_oxocarbon_light_theme()
  else
    theme_helpers.set_default_colorscheme()
  end

  vim.defer_fn(print_theme_collection_legend, 0)
end

return theme_helpers
