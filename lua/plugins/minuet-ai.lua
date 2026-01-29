return {
  {
    'milanglacier/minuet-ai.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      require('minuet').setup {
        provider = 'openai_fim_compatible',
        -- I understand 30s seems like A LOT but if the models need to be
        -- swapped in the GPUs memory, that can take a lot of time. If the
        -- model is loaded then responses are <1s
        request_timeout = 30,
        n_completions = 1,
        context_window = 32768,
        provider_options = {
          openai_fim_compatible = {
            api_key = 'TERM',
            name = 'Ollama',
            end_point = 'http://localhost:11434/v1/completions',
            model = 'qwen2.5-coder:14b-instruct-q6_K',
            optional = {
              max_tokens = 56,
              top_p = 0.9,
            },
          },
        },
      }
    end,
  },
}
