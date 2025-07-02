return {
  'yorik1984/newpaper.nvim',
  -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
  -- priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local api = vim.api
    local hl = api.nvim_set_hl
    local group = api.nvim_create_augroup('custom_newpaper', { clear = true })
    api.nvim_create_autocmd('ColorScheme', {
      group = group,
      pattern = 'NewPaper',
      callback = function()
        hl(0, "CmpItemAbbrMatch", { link = "CmpItemAbbrMatchCM" })
      end,
    })
    require("newpaper").setup({
      style = "dark",
      colors = {
        bg = 'NONE',
      },
    })

    -- vim.cmd.colorscheme('newpaper')
  end,
}
