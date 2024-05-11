-- The name is... The Harpooner
return {
	'ThePrimeagen/Harpoon',
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local map = vim.keymap.set

		harpoon:setup()

		map("n", "<leader>ha", function() harpoon:list():add() end)
		map("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		map("n", "<C-h>", function() harpoon:list():select(1) end)
		map("n", "<C-t>", function() harpoon:list():select(2) end)
		map("n", "<C-n>", function() harpoon:list():select(3) end)
		map("n", "<C-s>", function() harpoon:list():select(4) end)

	end,
}
