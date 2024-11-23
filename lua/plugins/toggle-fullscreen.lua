return {
  'propet/toggle-fullscreen.nvim',
  config = function()
    vim.keymap.set(
      'n',
      '<leader>z',
      '<cmd>lua require("toggle-fullscreen"):toggle_fullscreen()<cr>',
      { silent = true, desc = 'Toggle buffer fullscreen' }
    )

    -- If not using plugin use this
    -- map('n', '<leader>z', '<c-w>_ | <c-w>|', remap)
    -- map('n', '<leader>o', '<c-w>=', remap)
  end,
}
