-- load standard vis module, providing parts of the Lua API
require('vis');

-- local plugins are found in: ~/.config/vis
-- local themes are found in: ~/.config/vis/themes
-- local syntax-files are symlinked into: /usr/share/vis/lexers

-- editor configuration
vis.events.subscribe(vis.events.INIT, function()
  vis:command('set ignorecase')
  vis:command('set autoindent')
  -- command('set theme "plain-theme"')
end)

-- window cofiguration
vis.events.subscribe(vis.events.WIN_OPEN, function(win)
  vis:command('set colorcolumn 80')
  vis:command('set show-tabs on')
  vis:command('set expandtab on')
end)
