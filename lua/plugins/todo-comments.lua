return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ---@diagnostic disable-next-line: missing-fields
    opts = { signs = false },
  },
}
