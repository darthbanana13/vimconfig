return {
  -- This is still not there. No real way to stage hunks
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  opts = {
    integrations = {
      telescope = true,
      diffview = true,
    }
  }
}
