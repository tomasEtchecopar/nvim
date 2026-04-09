return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'gruvbox_dark',
        section_separators = '',
        component_separators = '',
        globalstatus = true,
      },
      tabline = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'diagnostics' },
        lualine_y = {},
        lualine_z = { 'location' },
      },
      sections = {},
      inactive_sections = {},
    },
  },
}
