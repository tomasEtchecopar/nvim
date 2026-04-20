return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      math = { enabled = false },
      render_modes = true,
      heading = {
        icons = { '# ', '## ', '### ', '#### ', '##### ', '###### ' },
        signs = false,
      },
      bullet = { icons = { '-', '-', '-', '-' } },
      checkbox = {
        unchecked = { icon = '[ ]' },
        checked = { icon = '[x]' },
      },
      code = { sign = false },
      dash = { icon = '─' },
      quote = { icon = '▌' },
    },
    keys = {
      { '<leader>or', '<cmd>RenderMarkdown toggle<CR>', desc = '[O]bsidian [R]ender toggle', ft = 'markdown' },
    },
  },
}
