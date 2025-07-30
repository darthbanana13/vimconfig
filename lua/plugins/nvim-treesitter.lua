return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'master',
    build = ':TSUpdate',
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      -- Move this to nvim-treesitter config if this plugin is removed
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          'bash',
          'comment',
          'css',
          'diff',
          'dockerfile',
          'git_config',
          'git_rebase',
          'gitattributes',
          'gitcommit',
          'gitignore',
          'go',
          'gomod',
          'gosum',
          'gowork',
          'html',
          'javascript',
          'json',
          'lua',
          'make',
          'markdown',
          'python',
          'query',
          'regex',
          'requirements',
          'toml',
          'vim',
          'vimdoc',
          'xml',
          'yaml',
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        },
        indent = { enable = true },
      -- End of things to move
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
              ['af'] = { query = '@function.outer', desc = 'Select function' },
              ['if'] = { query = '@function.inner', desc = 'Select inner part of the function' },
              ['ak'] = { query = '@class.outer', desc = 'Select class' },
              ['ik'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
              -- ['al'] = { query = '@assignment.inner', desc = 'Select right part of assignment' },
              ['al'] = { query = '@assignment.lhs', desc = 'Select left part of assignment' },
              ['aa'] = { query = '@assignment.outer', desc = 'Select assignment' },
              ['ar'] = { query = '@assignment.rhs', desc = 'Select right part of assignment' },
              ['ib'] = { query = '@block.inner', desc = 'Select inside block' },
              ['ab'] = { query = '@block.outer', desc = 'Select around block' },
              ['ic'] = { query = '@call.inner', desc = 'Select inside call' },
              ['ac'] = { query = '@call.outer', desc = 'Select outside call' },
              ['a/'] = { query = '@comment.outer', desc = 'Select comment' },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true or false
            include_surrounding_whitespace = false,
          },
          lsp_interop = {
            enable = true,
            border = 'none',
            floating_preview_opts = {},
            peek_definition_code = {
              ['<leader>df'] = '@function.outer',
              ['<leader>dF'] = '@class.outer',
            },
          },
        },
      })
    end,
  }
}
