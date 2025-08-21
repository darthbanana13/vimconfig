return {
  'propet/toggle-fullscreen.nvim',
  keys = {
    {
      '<leader>z',
      function()
        require('toggle-fullscreen'):toggle_fullscreen()
      end,
      desc = 'Toggle buffer fullscreen',
    },
  },
}
-- If not using plugin use this
-- map('n', '<leader>z', '<c-w>_ | <c-w>|', remap)
-- map('n', '<leader>o', '<c-w>=', remap)
