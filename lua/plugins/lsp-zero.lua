-- Right now, I don't see any benefit to configure LSP from scratch, so use lsp-zero
return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'zbirenbaum/copilot-cmp' },
      -- { 'tzachar/cmp-ai' },
      -- { 'milanglacier/minuet-ai.nvim' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-buffer' },
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()
      local formatting = require('lsp-zero.cmp').format()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      -- local cmp_action = lsp_zero.cmp_action()
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')
      -- this will load rafamadriz/friendly-snippets
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        preselect = 'item', -- Preselect item https://github.com/VonHeikemen/lsp-zero.nvim/blob/v4.x/doc/md/autocomplete.md#preselect-first-item
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        sources = {
          { name = 'path' },
          { name = 'copilot' },
          { name = 'nvim_lsp' },
          { name = 'luasnip', keyword_length = 2 },
          { name = 'buffer', keyword_length = 3 },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- Override default lsp-zero formatting to include lspkind
        -- formatting = lsp_zero.cmp_format(),
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = {
              -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
              -- can also be a function to dynamically calculate max width such as
              -- menu = function() return math.floor(0.45 * vim.o.columns) end,
              menu = 50, -- leading text (labelDetails)
              abbr = 50, -- actual suggestion item
            },
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            before = formatting.format,
          }),
          fields = formatting.fields,
        },
        mapping = cmp.mapping.preset.insert({
          ['<cr>'] = cmp.mapping.confirm({select = true}),
          ['<C-Right>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, {'i', 's'}),
          -- Jump to the previous snippet placeholder
          ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {'i', 's'}),
        })
      })
    end
  },
  {
    'L3MON4D3/LuaSnip',
    version = '^2',
    init = function()
      local map = vim.keymap.set
      local ls = require('luasnip')

      -- Don't use Super Tab, ls.jumpable(1) & ls.in_snippet() has problems if
      -- you'd like to leave the current node empty
      map({'i', 's'}, '<C-y>', function() ls.jump( 1) end, { silent = true, desc = 'Jump ahead in snippet' })
      map({'i', 's'}, '<C-m>', function() ls.jump(-1) end, { silent = true, desc = 'Jump backwards in snippet' })
    end,
  },
  {
    'onsails/lspkind.nvim',
    init = function()
      require('lspkind').init({
        symbol_map = {
          Copilot = '',
          minute = "",
          Ollama = "",
          HF = "",
          OpenAI = "",
          Codestral = "",
          Bard = "",
        },
      })
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- config keymaps https://github.com/VonHeikemen/lsp-zero.nvim/blob/v4.x/doc/md/tutorial.md#lsp-support
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = {buffer = event.buf}
          local map = vim.keymap.set

          map('n', 'K',  vim.lsp.buf.hover, { buffer = event.buf, desc='Show description' })
          map('n', 'gd', vim.lsp.buf.definition, { buffer = event.buf, desc='Go to definition' })
          -- map('n', 'gD', vim.lsp.buf.declaration, opts) -- I don't really use this, definition is better
          -- map('n', 'gi', vim.lsp.buf.implementation, opts) -- I don't really use this, definition is better
          -- map('n', 'go', vim.lsp.buf.type_definition, opts) -- I don't really use this, definition is better
          map('n', 'gr', vim.lsp.buf.references, { buffer = event.buf, desc='Show references' })
          -- map('n', 'gs', vim.lsp.buf.signature_help, opts) -- I don't really use this, hover is better
          map('n', '<F2>', vim.lsp.buf.rename, { buffer = event.buf, desc='Rename/Refactor name' })
          map({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', { buffer = event.buf, desc='Format file' })
          map('n', '<F4>', vim.lsp.buf.code_action, { buffer = event.buf, desc='Run code action' })
        end,
      })
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require('mason-lspconfig').setup({
        -- Optional: ansiblels gopls
        ensure_installed = {'bashls', 'lua_ls'},
        handlers = {
          lsp_zero.default_setup,
          -- To understand how to override defaults use: :h mason-lspconfig.setup_handlers()
          -- To see the default config for a LSP use :LspZeroViewConfigSource lsp_name
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
    end
  }
}
