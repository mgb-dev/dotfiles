return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.3",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    vim.filetype.add({
      pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
        ["*.asm"] = "nasm",
      },
    })

    treesitter.setup({
      highlight = { enable = true },
      indent = { enable = true },
      -- autotag = { enable = true },
      auto_install = true,
      additional_vim_regex_highlighting = false,
      ensure_installed = {
        "go",
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
        "nasm",
      },
    })
  end,
}
