return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      -- Automatically install the treesitter parsers
      auto_install = true,

      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
