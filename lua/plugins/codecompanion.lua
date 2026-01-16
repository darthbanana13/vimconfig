return {
  {
    'olimorris/codecompanion.nvim',
    version = '^18.0.0',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
      { 'franco-ruggeri/codecompanion-spinner.nvim' },
    },
    opts = {
      extensions = {
        spinner = {},
      },
      interactions = {
        chat = {
          adapter = {
            name = 'ollama',
            model = 'qwen3-coder:30b',
          },
          opts = {
            completion_provider = 'blink',
          },
        },
        inline = {
          adapter = {
            name = 'ollama',
            model = 'qwen3-coder:30b',
          },
        },
        cmd = {
          adapter = {
            name = 'ollama',
            model = 'qwen3-coder:30b',
          },
        },
        background = {
          adapter = {
            name = 'ollama',
            model = 'qwen3-coder:30b',
          },
          chat = {
            callbacks = {
              ['on_ready'] = {
                actions = {
                  'interactions.background.builtin.chat_make_title',
                },
                -- Enable "on_ready" callback which contains the title generation action
                enabled = true,
              },
            },
            opts = {
              -- Enable background interactions generally
              enabled = true,
            },
          },
        },
      },
    },
  },
}
