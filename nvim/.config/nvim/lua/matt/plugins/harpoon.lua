-- The name is... The Harpooner
return {
	"ThePrimeagen/Harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local map = vim.keymap.set

		harpoon:setup()

		map("n", "<leader>ha", function()
			harpoon:list():add()
		end)
		map("n", "<leader>he", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- Formerly <C-h>
		map("n", "<M-1>", function()
			harpoon:list():select(1)
		end, { desc = "[Alt]ernate to Harpoon [1]st item" })
		-- Formerly <C-t>
		map("n", "<M-2>", function()
			harpoon:list():select(2)
		end, { desc = "[Alt]ernate to Harpoon [2]nd item" })
		-- Formerly <C-n>
		map("n", "<M-3>", function()
			harpoon:list():select(3)
		end, { desc = "[Alt]ernate to Harpoon [3]rd item" })
		--Formerly <C-s>
		map("n", "<M-4>", function()
			harpoon:list():select(4)
		end, { desc = "[Alt]ernate to Harpoon [4]th item" })
	end,
}
