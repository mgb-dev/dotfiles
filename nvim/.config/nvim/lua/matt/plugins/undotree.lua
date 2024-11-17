-- UndoTree
return {
	'mbbill/undotree',
	keys = {
		{"<leader>u",function ()
			vim.cmd('UndotreeToggle')
		end, mode = 'n', desc = "Toggle UndoTree"},
	},
}
