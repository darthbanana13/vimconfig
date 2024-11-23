-- Define the PaperColor dark theme palette

return {
  {
    'marko-cerovac/material.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.g.material_style = 'palenight'

      require('material').setup({
        contrast = {
          terminal = false, -- Enable contrast for the built-in terminal
          sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
          floating_windows = false, -- Enable contrast for floating windows
          cursor_line = false, -- Enable darker background for the cursor line
          non_current_windows = false, -- Enable contrasted background for non-current windows
          filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
        },

        styles = { -- Give comments style such as bold, italic, underline etc.
          comments = { --[[ italic = true ]] },
          strings = { --[[ bold = true ]] },
          keywords = { --[[ underline = true ]] },
          functions = { --[[ bold = true, undercurl = true ]] },
          variables = {},
          operators = {},
          types = {},
        },

        plugins = { -- Uncomment the plugins that you use to highlight them
          -- Available plugins:
          -- 'dap',
          -- 'dashboard',
          -- 'eyeliner',
          -- 'fidget'
          -- 'flash'
          -- 'gitsigns',
          -- 'harpoon',
          -- 'hop',
          -- 'illuminate',
          -- 'indent-blankline',
          -- 'lspsaga',
          -- 'mini',
          -- 'neogit',
          -- 'neotest',
          -- 'neorg',
          -- 'noice'
          -- 'nvim-cmp',
          -- 'nvim-navic',
          -- 'nvim-tree',
          -- 'nvim-web-devicons',
          -- 'rainbow-delimiters',
          -- 'sneak',
          -- 'telescope',
          -- 'trouble',
          -- 'which-key',
        },

        disable = {
          colored_cursor = false, -- Disable the colored cursor
          borders = false, -- Disable borders between verticaly split windows
          background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
          term_colors = false, -- Prevent the theme from setting terminal colors
          eob_lines = false -- Hide the end-of-buffer lines
        },

        high_visibility = {
          lighter = false, -- Enable higher contrast text for lighter style
          darker = false -- Enable higher contrast text for darker style
        },

        lualine_style = 'default', -- Lualine style ( can be 'stealth' or 'default' )

        async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

        -- If you want to override the default colors, set this to a function
        -- custom_colors = nil,
        custom_colors = function(colors)
          -- PaperColor dark variant colors
          local paperColorDark = {
              bg = '#1c1c1c', -- background
              fg = '#e7e9db', -- foreground, slightly off-white for better contrast
              red = '#f28b82', -- more vivid red
              green = '#a6e22e', -- vivid green
              yellow = '#ffdf80', -- vivid yellow
              blue = '#5fafd7', -- blue
              -- blue = '#82aaff', -- vivid blue
              magenta = '#c792ea', -- vivid magenta
              cyan = '#89ddff', -- vivid cyan
              white = '#ffffff', -- white for higher contrast elements
              black = '#000000', -- black for higher contrast elements
              orange = '#f99157', -- vivid orange
              pink = '#ff9cac', -- vivid pink
              comment_grey = '#808080', -- comment grey
              gutter_fg_grey = '#abb2bf', -- gutter foreground grey
              cursor_grey = '#2c2f3e', -- cursor grey
              visual_grey = '#3a3e4d', -- visual grey
              menu_grey = '#3e4451', -- menu grey
              special_grey = '#3b4048', -- special grey
              pale_blue = '#b0c9ff', -- a lighter shade of blue for pale blue
              purple = '#c792ea', -- vivid purple
              dark_red = '#e06c75', -- a darker, but still vivid red
              dark_green = '#98c379', -- a darker shade of green
              dark_yellow = '#e5c07b', -- a darker shade of yellow
              dark_blue = '#61afef', -- a darker shade of blue
              dark_cyan = '#56b6c2', -- a darker shade of cyan
              dark_purple = '#c678dd', -- a darker shade of purple
              dark_orange = '#d19a66', -- a darker shade of orange
          }

          -- Mapping PaperColor to material.nvim color slots
          colors.main.white = paperColorDark.white
          colors.main.gray = paperColorDark.comment_grey
          colors.main.black = paperColorDark.black
          colors.main.red = paperColorDark.red
          colors.main.green = paperColorDark.green
          colors.main.yellow = paperColorDark.yellow
          colors.main.blue = paperColorDark.blue
          colors.main.paleblue = paperColorDark.paleblue
          colors.main.cyan = paperColorDark.cyan
          colors.main.purple = paperColorDark.purple
          colors.main.orange = paperColorDark.orange
          colors.main.pink = paperColorDark.pink

          colors.main.darkred = paperColorDark.darkred
          colors.main.darkgreen = paperColorDark.darkgreen
          colors.main.darkyellow = paperColorDark.darkyellow
          colors.main.darkblue = paperColorDark.darkblue
          colors.main.darkcyan = paperColorDark.darkcyan
          colors.main.darkpurple = paperColorDark.darkpurple
          colors.main.darkorange = paperColorDark.darkorange
          -- colors.editor.bg = paperColorDark.bg
          -- colors.editor.bg_alt = paperColorDark.special_grey
          colors.editor.fg = paperColorDark.fg
          colors.editor.fg_dark = paperColorDark.gutter_fg_grey
          colors.editor.selection = paperColorDark.visual_grey
          colors.editor.contrast = paperColorDark.menu_grey
          colors.editor.active = paperColorDark.cursor_grey
          colors.editor.border = paperColorDark.comment_grey
          colors.editor.line_numbers = paperColorDark.gutter_fg_grey
          colors.editor.highlight = paperColorDark.special_grey
          colors.editor.disabled = paperColorDark.comment_grey
          colors.editor.accent = paperColorDark.blue

          colors.syntax.variable = paperColorDark.fg
          colors.syntax.field = paperColorDark.fg
          colors.syntax.keyword = paperColorDark.magenta
          colors.syntax.value = paperColorDark.orange
          colors.syntax.fn = paperColorDark.blue
          colors.syntax.string = paperColorDark.green
          colors.syntax.operator = paperColorDark.cyan
          colors.syntax.type = paperColorDark.yellow
          colors.syntax.comments = paperColorDark.comment_grey

          colors.git.added = paperColorDark.green
          colors.git.removed = paperColorDark.red
          colors.git.modified = paperColorDark.blue

          colors.lsp.error = paperColorDark.red
          colors.lsp.warning = paperColorDark.yellow
          colors.lsp.info = paperColorDark.blue
          colors.lsp.hint = paperColorDark.cyan

        end,
        custom_highlights = {}, -- Overwrite highlights with your own
      })

      -- vim.cmd.colorscheme('material')
    end,
  }
}
