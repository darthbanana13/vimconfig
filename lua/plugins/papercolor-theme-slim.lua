return {
  'pappasam/papercolor-theme-slim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local api = vim.api
    local hl = api.nvim_set_hl
    local group = api.nvim_create_augroup('custom_papercolorslim_transparent_background', { clear = true })

    api.nvim_create_autocmd('ColorScheme', {
      group = group,
      pattern = 'PaperColorSlim',
      callback = function()
        hl(0, 'Normal', { bg='NONE' })
        hl(0, 'GitSignsAddNr', { link = 'DiffAdd' })
        hl(0, 'GitSignsChangeNr', { link = 'DiffChange' })
        hl(0, 'GitSignsDeleteNr', { link = 'DiffDelete' })
        -- TODO: Find a way to solve background color
        hl(0, 'LuaLineDiffAdd', { link = 'Statement' })
        hl(0, 'LuaLineDiffChange', { link = 'Delimiter' })
        hl(0, 'LuaLineDiffDelete', { link = 'Debug' })
      end,
    })
    vim.cmd.colorscheme('PaperColorSlim')
  end,
}
