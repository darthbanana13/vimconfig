return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  keys = {
    { -- Hydra Mode --
      '<leader>?',
      function()
        require('which-key').show({
          global = false,
          loop = true,  -- this keeps the pop-up open until <esc> is hit
        })
      end,
      desc = 'Buffer Local Keymaps (which-key hydra mode)',
    },
  },
}
