return {
  "EdenEast/nightfox.nvim",
  priority = 1000,
  config = function()
    local options = {
      transparent = true,
    }
    require("nightfox").setup({
      options = options,
    })

    vim.cmd.colorscheme("carbonfox")
  end,
}
