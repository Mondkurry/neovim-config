
local version_info = vim.version()
-- local version_string = string.format("N E O V I M %d.%d.%d", version_info.major, version_info.minor, version_info.patch)
local version_string = string.format("N E O V I M", version_info.major, version_info.minor, version_info.patch)
local aryan_version_string = string.format("A R Y A N    N E O V I M", version_info.major, version_info.minor, version_info.patch)

local header = {
" █████╗ ██████╗ ██╗   ██╗ █████╗ ███╗   ██╗",
"██╔══██╗██╔══██╗╚██╗ ██╔╝██╔══██╗████╗  ██║",
"███████║██████╔╝ ╚████╔╝ ███████║██╔██╗ ██║",
"██╔══██║██╔══██╗  ╚██╔╝  ██╔══██║██║╚██╗██║",
"██║  ██║██║  ██║   ██║   ██║  ██║██║ ╚████║",
"╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝",
" ",
version_string,
" ",
}

local monkey = {
"                                                               ",
"                                  ██████████████               ",
"                                ██▓▓▓▓▓▓▓▓▓▓▓▓▓▓████           ",
"                              ████▓▓▓▓▓▓░░░░▓▓▓▓░░██           ",
"                            ██▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░██         ",
"                            ██▓▓▓▓▓▓░░░░░░██░░░░██░░██         ",
"                            ██▓▓██▓▓░░░░░░██░░░░██░░██         ",
"                            ██▓▓██▓▓░░██░░░░░░░░░░░░░░██       ",
"                              ██▓▓▓▓██░░░░░░░░░░░░░░░░░░██     ",
"                  ██████        ██▓▓██░░░░░░░░████░░░░░░██     ",
"                ██▓▓▓▓▓▓██        ██░░████████░░░░██████       ",
"              ██▓▓▓▓▓▓▓▓▓▓██      ████░░░░░░░░░░░░░░██         ",
"              ██▓▓▓▓██▓▓▓▓██    ██▓▓▓▓██████████████           ",
"              ██▓▓▓▓▓▓██████████▓▓▓▓▓▓▓▓▓▓██▓▓▓▓██             ",
"                ██▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓██▓▓▓▓██▓▓▓▓██           ",
"                  ████████████▓▓▓▓▓▓▓▓▓▓██▓▓▓▓██▓▓▓▓██         ",
"                            ██████████▓▓██░░░░░░██░░░░██       ",
"                          ██░░░░░░░░░░██░░░░░░░░██░░░░██       ",
"                          ██░░░░░░░░░░██░░░░░░██░░░░██         ",
"                          ██████████████████████████           ",
"                                                               ",
}

local monkey2 = {
"                                                                                        ",
"                                        ▓▓▓▓▓▓▓▓▓▓                                      ",
"                                      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                    ",
"                                    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                  ",
"                                  ▓▓▓▓░░░░░░▓▓░░░░░░▓▓▓▓                                ",
"                              ░░░░▓▓░░░░░░░░░░░░░░░░░░▓▓░░░░                            ",
"                              ░░░░▓▓░░  ██░░░░░░  ██░░▓▓░░░░                            ",
"                                ░░▓▓░░████░░░░░░████░░▓▓░░                              ",
"                                  ▓▓░░░░░░░░░░░░░░░░░░▓▓                                ",
"                                    ▓▓░░░░░░░░░░░░░░▓▓                                  ",
"                                      ▓▓▓▓░░░░░░▓▓▓▓                                    ",
"                                          ▓▓▓▓▓▓        ░░                              ",
"                                        ▓▓▓▓▓▓▓▓▓▓      ▓▓                              ",
"                                        ▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓                              ",
"                                      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                ",
"                                      ▓▓▓▓░░▓▓░░▓▓▓▓                                    ",
"                                                                                        ",
"                                  A R Y A N    N E O V I M                              ",
"                                                                                        ",
}

return {
  'nvimdev/dashboard-nvim',                                                             
  event = 'VimEnter',                                                                   
  config = function()
  local db = require('dashboard')
  db.setup({
    theme = 'hyper',
    config = {
      header = header,
      --[[ week_header = {
       enable = true,
      }, ]]
      project = {
        enable = true,
      },
      disable_move = true,
      shortcut = {
        {
          desc = 'Update',
          icon = ' ',
          group = 'Include',
          action = 'Lazy update',
          key = 'u',
        },
        {
          icon = ' ',
          desc = 'Files',
          group = 'Function',
          action = 'Telescope find_files find_command=rg,--ignore,--hidden,--files',
          key = 'f',
        },
        {
          icon = ' ',
          desc = 'Apps',
          group = 'String',
          action = 'Telescope app',
          key = 'a',
        },
        {
          icon = ' ',
          desc = 'dotfiles',
          group = 'Constant',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
    },
  })  
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
