return {
  {
    'saghen/blink.cmp',
    -- use a release tag to download pre-built binaries
    version = '1.*',
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
      { 'fang2hou/blink-copilot' },
    },
    opts = {
      keymap = {
        preset = 'none',
        ['<C-y>'] = { 'select_and_accept', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      completion = {
        -- The behavior is wierd in some cases with gost text enabled.
        -- Maybe enable it if we want to manually trigger the completion menu.
        -- ghost_text = {
        --   enabled = true,
        -- },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 1000,
        },
        menu = {
          draw = {
            -- We don't need label_description now because label and label_description are already
            -- combined together in label by colorful-menu.nvim.
            columns = { { 'kind_icon' }, { 'label', gap = 1 } },
            components = {
              label = {
                width = { fill = true, max = 60 },
                text = function(ctx)
                  return require('colorful-menu').blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require('colorful-menu').blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
      },

      signature = {
        enabled = true,
        window = {
          show_documentation = false,
        },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'path', 'copilot', 'lsp', 'snippets', 'buffer' },
        -- default = { 'path', 'lsp', 'snippets', 'buffer' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-copilot',
            score_offset = 100,
            async = true,
          },
        },
      },

      snippets = { preset = 'luasnip' },

      fuzzy = { implementation = 'prefer_rust_with_warning' }
    },
    opts_extend = { 'sources.default' }
  },
  {
    'mason-org/mason.nvim',
    dependencies = {
      { 'mason-org/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' }, -- Recognize vim as a global variable
              },
              workspace = {
                checkThirdParty = false, -- Disable third-party checks
              },
            },
          },
        },
        bashls = {},
      },
    },
    config = function(_, opts)
      require('mason').setup(opts)

      require('mason-lspconfig').setup({
        ensure_installed = opts.servers and vim.tbl_keys(opts.servers) or {},

        -- config keymaps https://github.com/VonHeikemen/lsp-zero.nvim/blob/v4.x/doc/md/tutorial.md#lsp-support
        vim.api.nvim_create_autocmd('LspAttach', {
          desc = 'LSP actions',
          group = vim.api.nvim_create_augroup('UserLspConfig', {}),
          callback = function(ev)
            -- local opts = {buffer = event.buf}
            local map = vim.keymap.set
            local buf = vim.lsp.buf

            map('n', 'K',  buf.hover, { buffer = ev.buf, desc='Show description' })
            map('n', 'gd', buf.definition, { buffer = ev.buf, desc='Go to definition' })
            -- map('n', 'gD', buf.declaration, opts) -- I don't really use this, definition is better
            -- map('n', 'gi', buf.implementation, opts) -- I don't really use this, definition is better
            -- map('n', 'go', buf.type_definition, opts) -- I don't really use this, definition is better
            map('n', 'gr', buf.references, { buffer = ev.buf, desc='Show references' })
            -- map('n', 'gs', buf.signature_help, opts) -- I don't really use this, hover is better
            map('n', '<F2>', buf.rename, { buffer = ev.buf, desc='Rename/Refactor name' })
            map({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', { buffer = ev.buf, desc='Format file' })
            map('n', '<F4>', buf.code_action, { buffer = ev.buf, desc='Run code action' })
            map('n', '<leader>k', function ()
              vim.diagnostic.open_float(nil, {
                focusable = false,
                scope = 'line',
                border = 'rounded',
              })
            end, { buffer = ev.buf, desc='Show diagnostics for line' })
          end,
        })
      })

      vim.diagnostic.config({
        virtual_text = {
          prefix = '■',
          spacing = 4,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      for server, config in pairs(opts.servers or {}) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    -- init = function()
    --   local map = vim.keymap.set
    --   local ls = require('luasnip')
    --
    --   -- TODO: Verify if this is still needed, currently this configuration 
    --        makes <CR> not work in insert mode
    --   -- Don't use Super Tab, ls.jumpable(1) & ls.in_snippet() has problems if
    --   --   you'd like to leave the current node empty
    --   map({'i', 's'}, '<C-y>', function() ls.jump( 1) end, { silent = true, desc = 'Jump ahead in snippet' })
    --   map({'i', 's'}, '<C-m>', function() ls.jump(-1) end, { silent = true, desc = 'Jump backwards in snippet' })
    -- end,
  },
  {
    'xzbdmw/colorful-menu.nvim',
    config = function()
        -- You don't need to set these options.
        require('colorful-menu').setup({
            ls = {
                lua_ls = {
                    -- Maybe you want to dim arguments a bit.
                    arguments_hl = '@comment',
                },
                gopls = {
                    -- By default, we render variable/function's type in the right most side,
                    -- to make them not to crowd together with the original label.

                    -- when true:
                    -- foo             *Foo
                    -- ast         "go/ast"

                    -- when false:
                    -- foo *Foo
                    -- ast "go/ast"
                    align_type_to_right = true,
                    -- When true, label for field and variable will format like "foo: Foo"
                    -- instead of go's original syntax "foo Foo". If align_type_to_right is
                    -- true, this option has no effect.
                    add_colon_before_type = false,
                    -- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
                    preserve_type_when_truncate = true,
                },
                -- for lsp_config or typescript-tools
                ts_ls = {
                    -- false means do not include any extra info,
                    -- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
                    extra_info_hl = '@comment',
                },
                vtsls = {
                    -- false means do not include any extra info,
                    -- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
                    extra_info_hl = '@comment',
                },
                ['rust-analyzer'] = {
                    -- Such as (as Iterator), (use std::io).
                    extra_info_hl = '@comment',
                    -- Similar to the same setting of gopls.
                    align_type_to_right = true,
                    -- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
                    preserve_type_when_truncate = true,
                },
                clangd = {
                    -- Such as "From <stdio.h>".
                    extra_info_hl = '@comment',
                    -- Similar to the same setting of gopls.
                    align_type_to_right = true,
                    -- the hl group of leading dot of "•std::filesystem::permissions(..)"
                    import_dot_hl = '@comment',
                    -- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
                    preserve_type_when_truncate = true,
                },
                zls = {
                    -- Similar to the same setting of gopls.
                    align_type_to_right = true,
                },
                roslyn = {
                    extra_info_hl = '@comment',
                },
                dartls = {
                    extra_info_hl = '@comment',
                },
                -- The same applies to pyright/pylance
                basedpyright = {
                    -- It is usually import path such as "os"
                    extra_info_hl = '@comment',
                },
                pylsp = {
                    extra_info_hl = '@comment',
                    -- Dim the function argument area, which is the main
                    -- difference with pyright.
                    arguments_hl = '@comment',
                },
                -- If true, try to highlight "not supported" languages.
                fallback = true,
                -- this will be applied to label description for unsupport languages
                fallback_extra_info_hl = '@comment',
            },
            -- If the built-in logic fails to find a suitable highlight group for a label,
            -- this highlight is applied to the label.
            fallback_highlight = '@variable',
            -- If provided, the plugin truncates the final displayed text to
            -- this width (measured in display cells). Any highlights that extend
            -- beyond the truncation point are ignored. When set to a float
            -- between 0 and 1, it'll be treated as percentage of the width of
            -- the window: math.floor(max_width * vim.api.nvim_win_get_width(0))
            -- Default 60.
            max_width = 60,
        })
    end,
  },
}
