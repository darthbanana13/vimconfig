return {
  "folke/trouble.nvim",
  dependencies = { 'nvim-telescope/telescope.nvim' },
  cmd = "Trouble",
  keys = {
    {
      "<leader>xp",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
  },
  config = true,
}
