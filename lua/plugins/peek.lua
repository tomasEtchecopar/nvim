return {
  {
    'toppair/peek.nvim',
    ft = 'markdown',
    build = 'deno task --quiet build:fast',
    ---@module 'peek'
    opts = {
      auto_load = false,
      close_on_bdelete = true,
      syntax = true,
      theme = 'dark',
      app = 'browser',
    },
    keys = {
      {
        '<leader>ov',
        function()
          local peek = require 'peek'
          if peek.is_open() then peek.close() else peek.open() end
        end,
        desc = '[O]bsidian pre[V]iew',
        ft = 'markdown',
      },
    },
  },
}
