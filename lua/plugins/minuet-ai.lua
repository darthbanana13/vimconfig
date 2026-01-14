return {
  -- If this could do async with cmp, that would be amazing with larger local models
  {
    'milanglacier/minuet-ai.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'Saghen/blink.cmp' },
    },
    config = function()
      require('minuet').setup {
        provider = 'openai_fim_compatible',
        request_timeout = 10,
        n_completions = 1, -- recommend for local model for resource saving
        -- I recommend beginning with a small context window size and incrementally
        -- expanding it, depending on your local computing power. A context window
        -- of 512, serves as an good starting point to estimate your computing
        -- power. Once you have a reliable estimate of your local computing power,
        -- you should adjust the context window to a larger value.
        context_window = 32768,
        provider_options = {
          openai_fim_compatible = {
            api_key = 'TERM',
            name = 'Ollama',
            end_point = 'http://localhost:11434/v1/completions',
            -- model = 'qwen2.5-coder:32b-instruct-q3_K_S',
            model = 'qwen2.5-coder:7b',
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
