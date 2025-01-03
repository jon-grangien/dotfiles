local theme_helpers = {}

ThemeHelpersColorSchemeIndex = 0

local function set_gruvbox_theme()
  vim.o.background = 'dark'
  vim.g['gruvbox_italic'] = 1
  vim.g['airline_theme'] = 'gruvbox'
  vim.cmd('colorscheme gruvbox')

  vim.print('Gruvbox')
end

local function set_papercolor_theme()
  vim.o.background = 'light'
  vim.cmd('colorscheme Papercolor')
  --let g:airline_theme='papercolor'
  vim.g['airline_theme'] = 'papercolor'

  vim.print('Papercolor light')
end

local function set_tokyonight_theme()
  vim.o.background = 'dark'
  vim.cmd('colorscheme tokyonight-night')

  vim.print('Tokyonight')
end

local function set_tokyoday_theme()
  vim.o.background = 'light'
  vim.cmd('colorscheme tokyonight-day')

  vim.print('Tokyonight day')
end

function theme_helpers.flip_to_next_colorscheme()
  ThemeHelpersColorSchemeIndex = ThemeHelpersColorSchemeIndex + 1

  if ThemeHelpersColorSchemeIndex == 1 then
    set_papercolor_theme()
  elseif ThemeHelpersColorSchemeIndex == 2 then
    set_tokyonight_theme()
  elseif ThemeHelpersColorSchemeIndex == 3 then
    set_tokyoday_theme()
  else
    set_gruvbox_theme()
    ThemeHelpersColorSchemeIndex = 0
  end
end

return theme_helpers
