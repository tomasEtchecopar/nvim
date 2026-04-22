local wal_colors = vim.fn.expand('~/.cache/wal/colors-wal.vim')
local watcher = vim.uv.new_fs_event()
watcher:start(wal_colors, {}, function(err, _, _)
  if not err then
    vim.schedule(function()
      vim.cmd.colorscheme('wal')
    end)
  end
end)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})
