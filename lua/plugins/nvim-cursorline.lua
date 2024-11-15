return {
  "yamatsum/nvim-cursorline",
  config = function()
    require('nvim-cursorline').setup {
      cursorline = {
        enable = false,
      },
      cursorword = {
        enable = true,
        min_lenght = 3,
        hl = { underline = true },
      },
    }
  end,
}
