return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ---@module 'obsidian'
    ---@type obsidian.config.ClientOpts
    opts = {
      workspaces = {
        { name = 'miVault', path = '~/miVault' },
      },
      completion = {
        nvim_cmp = false,
        blink = true,
        min_chars = 2,
      },
      ui = { enable = false },
      follow_url_func = function(url)
        vim.fn.jobstart({ 'xdg-open', url })
      end,
    },
    keys = {
      { '<leader>on', '<cmd>ObsidianNew<CR>',           desc = '[O]bsidian [N]ew note' },
      { '<leader>oo', '<cmd>ObsidianQuickSwitch<CR>',   desc = '[O]bsidian [O]pen note' },
      { '<leader>of', '<cmd>ObsidianSearch<CR>',        desc = '[O]bsidian [F]ind in vault' },
      { '<leader>ob', '<cmd>ObsidianBacklinks<CR>',     desc = '[O]bsidian [B]acklinks' },
      { '<leader>ol', '<cmd>ObsidianLinks<CR>',         desc = '[O]bsidian [L]inks' },
      { '<leader>ot', '<cmd>ObsidianTags<CR>',          desc = '[O]bsidian [T]ags' },
      { '<leader>od', '<cmd>ObsidianToday<CR>',         desc = '[O]bsidian [D]aily note' },
      { '<leader>op', '<cmd>ObsidianPasteImg<CR>',      desc = '[O]bsidian [P]aste image' },
    },
  },
}
