return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'arkav/lualine-lsp-progress',
      'tpope/vim-fugitive',
      'lewis6991/gitsigns.nvim',
    },
    config = function()
      local buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end
      local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
          }
        end
      end

      local configs = {
        options = {
          theme = 'powerline_dark',
        },
        globalstatus = true,
        extensions = {
          'fugitive',
        },
        sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      local function insa(component)
        table.insert(configs.sections.lualine_a, component)
      end

      local function insb(component)
        table.insert(configs.sections.lualine_b, component)
      end

      local function insc(component)
        table.insert(configs.sections.lualine_c, component)
      end

      local function insx(component)
        table.insert(configs.sections.lualine_x, component)
      end

      local function insy(component)
        table.insert(configs.sections.lualine_y, component)
      end

      local function insz(component)
        table.insert(configs.sections.lualine_z, component)
      end

      insa {
        'mode',
      }

      insb {
        'FugitiveHead',
        icon = '',
      }

      insb {
        'diff',
        colored = true,
        diff_color = {
          -- Same color values as the general color option can be used here.
          added    = 'LuaLineDiffAdd',    -- Changes the diff's added color
          modified = 'LuaLineDiffChange', -- Changes the diff's modified color
          removed  = 'LuaLineDiffDelete', -- Changes the diff's removed color you
        },
        source = diff_source
      }

      insb {
        'diagnostics',

        -- Table of diagnostic sources, available sources are:
        --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
        -- or a function that returns a table as such:
        --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
        sources = { 'nvim_diagnostic' },
      }

      insc {
        'filename',
        path = 1,
        -- If buffer is not empty
        cond = buffer_not_empty,
      }

      insc {
        'lsp_progress',
        display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
        timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 10000 },
        separators = {
          lsp_client_name = { pre = ' ', post = '' },
        }
      }

      insc {
        require 'minuet.lualine',
      }

      insx {
        'searchcount',
        maxcount = 999,
        timeout = 500,
      }

      insx {
        'encoding'
      }

      insx {
        'fileformat'
      }


      insx {
        'filetype',
        icon_only = true,
      }

      insy {
        'filesize',
        cond = buffer_not_empty,
      }

      insz {
        'progress'
      }

      insz {
        'location'
      }

      require('lualine').setup(configs)
    end,
}
