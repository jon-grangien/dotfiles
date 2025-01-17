local theme_helpers = {}

ThemeHelpersColorSchemeIndex = 1

local function set_gruvbox_theme()
  vim.o.background = 'dark'
  vim.g['gruvbox_italic'] = 1
  vim.g['airline_theme'] = 'gruvbox'
  vim.cmd('colorscheme gruvbox')
end

local function set_papercolor_theme()
  vim.o.background = 'light'
  vim.g['airline_theme'] = 'papercolor'
  vim.cmd('colorscheme Papercolor')
  --let g:airline_theme='papercolor'
end

local function set_tokyonight_theme()
  vim.o.background = 'dark'
  vim.g['airline_theme'] = 'gruvbox'
  vim.cmd('colorscheme tokyonight-night')
end

local function set_tokyoday_theme()
  vim.o.background = 'light'
  vim.g['airline_theme'] = 'papercolor'
  vim.cmd('colorscheme tokyonight-day')
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
  else
    set_gruvbox_theme()
    ThemeHelpersColorSchemeIndex = 1
  end

  vim.print('1 Gruvbox | 2 Papercolor | 3 Tokyonight | 4 Tokyonight-day')
end

return theme_helpers
