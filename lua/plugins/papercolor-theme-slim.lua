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
        hl(0, 'Normal', { bg = 'NONE' })
        hl(0, 'GitSignsAddNr', { link = 'DiffAdd' })
        hl(0, 'GitSignsChangeNr', { link = 'DiffChange' })
        hl(0, 'GitSignsDeleteNr', { link = 'DiffDelete' })

        -- Colors are not linked because they add a wierd bg
        hl(0, 'LuaLineDiffAdd', { fg = '#afd700', bg = '#444444' }) -- fg same as hl group Statement
        hl(0, 'LuaLineDiffChange', { fg = '#00afaf', bg = '#444444' }) -- fg same as hl group Delimited
        hl(0, 'LuaLineDiffDelete', { fg = '#ff5faf', bg = '#444444' }) -- fg same as hl group Debug

        hl(0, 'CmpItemAbbr', { link = 'Normal' })
        hl(0, 'CmpItemMenu', { link = 'Comment' })
        hl(0, 'CmpItemAbbrMatch', { link = 'Identifier' })
        hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'Identifier' })

        hl(0, 'CmpItemKind', { link = 'Type' })
        hl(0, 'CmpItemKindText', { link = 'String' })
        hl(0, 'CmpItemKindMethod', { link = 'Function' })
        hl(0, 'CmpItemKindFunction', { link = 'Function' })
        hl(0, 'CmpItemKindConstructor', { link = 'Function' })
        hl(0, 'CmpItemKindField', { link = 'Identifier' })
        hl(0, 'CmpItemKindVariable', { link = 'Identifier' })
        hl(0, 'CmpItemKindValue', { link = 'Constant' })
        hl(0, 'CmpItemKindConstant', { link = 'Constant' })
        hl(0, 'CmpItemKindClass', { link = 'Type' })
        hl(0, 'CmpItemKindStruct', { link = 'Type' })
        hl(0, 'CmpItemKindInterface', { link = 'Type' })
        hl(0, 'CmpItemKindModule', { link = 'Include' })
        hl(0, 'CmpItemKindProperty', { link = 'Identifier' })
        hl(0, 'CmpItemKindKeyword', { link = 'Keyword' })
        hl(0, 'CmpItemKindUnit', { link = 'Number' })
        hl(0, 'CmpItemKindFile', { link = 'Directory' })
        hl(0, 'CmpItemKindFolder', { link = 'Directory' })
        hl(0, 'CmpItemKindSnippet', { link = 'String' })
        hl(0, 'CmpItemKindEvent', { link = 'Constant' })
        hl(0, 'CmpItemKindTypeParameter', { link = 'Type' })
        hl(0, 'CmpItemKindCopilot', { link = 'Constant' })
        hl(0, 'CmpItemKindColor', { link = 'Special' })
        hl(0, 'CmpItemKindEnum', { link = 'Type' })
        hl(0, 'CmpItemEnumMember', { link = 'Constant' })
        hl(0, 'CmpItemKindOperator', { link = 'Operator' })
        hl(0, 'CmpItemKindReference', { link = 'Identifier' })
      end,
    })

    vim.cmd.colorscheme('PaperColorSlim')
  end,
}
