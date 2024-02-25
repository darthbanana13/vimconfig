return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        -- TODO: Harness the evil configuration from the plugin's README
        options = {
          theme = 'powerline_dark',
        },
      }
    end,
}
