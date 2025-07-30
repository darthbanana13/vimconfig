return {
  'stevearc/aerial.nvim',
  dependencies = {
     'nvim-treesitter/nvim-treesitter',
     'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('telescope').load_extension('aerial')
    require('aerial').setup({
      layout = {
        default_direction = 'prefer_left',
      },
      close_automatic_events = { 'unfocus', 'switch_buffer', 'unsupported' },
    })
    vim.keymap.set(
      'n',
      '<C-s>',
      require('telescope').extensions.aerial.aerial,
      { desc='Filter buffer symbols' }
    )
  end,
}
