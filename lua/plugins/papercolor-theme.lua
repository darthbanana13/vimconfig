return {
  {
    'NLKNguyen/papercolor-theme',
    config = function()
      vim.o.background = 'dark'
      vim.g.PaperColor_Theme_Options = {
        theme = {
          ["default.dark"] = {
            transparent_background = 1
          }
        }
      }
    end
  }
}
