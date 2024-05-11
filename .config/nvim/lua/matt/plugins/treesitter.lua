return {
  "nvim-treesitter/nvim-treesitter",
  event = {"BufReadPre", "BufNewFile"},
  build = "<cmd>TSUpdate<CR>",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = {enable = true},
      indent = {enable = true},
      autotag = {enable = true},
      auto_install = true,
      additional_vim_regex_highlighting = false,
      ensure_installed = {
        "bash",
        "comment",
        "dot",
        "jsdoc",
        "json",
        "regex",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "toml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "lua",
        "dockerfile",
        "gitignore",
        "vimdoc",
      },
    })
  end,
}
