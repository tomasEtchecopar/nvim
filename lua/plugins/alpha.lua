return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-mini/mini.icons' },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      dashboard.section.header.val = {
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⡀⣸⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠁⢠⡀⠿⣿⣷⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⠈⣇⢀⣿⠁⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⠀⠀⠈⢸⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⢹⣆⠀⠀⡄⣿⠇⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣧⡀⣧⠿⣰⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠱⣄⡀⢸⣿⣿⣿⣧⣷⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⣰⡆⠀⠀⠉⣿⣿⣟⣿⣿⡟⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠹⡇⠀⠀⢰⣞⣻⣿⣿⣿⣿⣮⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⢀⣤⢽⣿⣿⣿⣿⣿⣿⣥⢀⠀⠀⠀⠀⣠⡄⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⢸⣿⣮⢙⣿⣿⣿⣿⣿⣿⣏⠀⠀⠀⠛⠉⠁⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⣀⣀⣉⡷⣿⣿⣿⣿⣿⣿⣿⡿⣀⣦⣤⣤⣀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⣠⣴⣿⣽⣿⡿⣿⡯⣿⢽⣿⡿⢟⡛⢷⣯⣝⡻⢾⣧⣀⡀⠀⠀',
        '⠀⢀⣸⠿⣾⣿⣿⣯⣼⣿⡿⢿⡇⣭⡌⣿⣿⣦⣾⣿⠿⣷⣦⣭⣛⡷⠦',
        '⠚⠉⠀⠈⠁⢈⣿⢿⣿⠿⠿⢾⡏⠛⠋⠈⢿⣮⠛⢯⠀⠀⠉⠛⠏⠁⠀',
        '⠀⠀⠀⠀⡶⠟⠁⠈⠁⠀⠀⠸⡇⠀⠀⠀⠀⠙⠧⠀⠀⠀⠀⠀⠀⠀⠀',
      }

      dashboard.section.buttons.val = {
        dashboard.button('e', '  New file', '<cmd>ene <BAR> startinsert<CR>'),
        dashboard.button('f', '  Find file', '<cmd>Telescope find_files<CR>'),
        dashboard.button('r', '  Recent files', '<cmd>Telescope oldfiles<CR>'),
        dashboard.button('g', '  Live grep', '<cmd>Telescope live_grep<CR>'),
        dashboard.button('l', '  Lazy', '<cmd>Lazy<CR>'),
        dashboard.button('q', '  Quit', '<cmd>qa<CR>'),
      }

      dashboard.section.footer.val = (function()
        local stats = require('lazy').stats()
        return string.format(' %d plugins loaded in %.2fms', stats.loaded, stats.startuptime)
      end)()
      dashboard.section.footer.opts.hl = 'Comment'

      dashboard.config.layout = {
        { type = 'padding', val = 2 },
        dashboard.section.header,
        { type = 'padding', val = 2 },
        dashboard.section.buttons,
        { type = 'padding', val = 1 },
        dashboard.section.footer,
      }

      alpha.setup(dashboard.config)
    end,
  },
}
