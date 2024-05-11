return {
  "nvim-lualine/lualine.nvim",
 dependencies = {
   "nvim-tree/nvim-web-devicons",
 },
 config = function ()
   local lualine = require("lualine")

   --local colors = {

   --}
   lualine.setup({
    options = {
      icons_enabled = true,
      theme = 'auto',
    }
   })
 end,
}
