return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      -- please "make" sure you have installed make and /or gcc
      -- and run make inside the .local/share/nvim/lazy/telescope-fzf-native.nvim/
      make = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = {"smart"},
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- [[keymaps]] --
    local map = vim.keymap.set
    local tel_buil = require('telescope.builtin')

    map("n", "<leader>ff", tel_buil.find_files, { desc = "[F]ind [F]iles in cwd" })
    map("n", "<leader>fb", tel_buil.buffers, { desc = "[F]ind opened [B]uffers" })
    map("n", "<leader>fr", tel_buil.oldfiles, { desc = "[F]ind [R]ecent files" })
    map("n", "<leader>fk", tel_buil.keymaps, { desc = "[F]ind [K]eymaps" })
    map("n", "<leader>fs", tel_buil.live_grep, { desc = "[F]ind [S]tring in cwd" })
    map('n', '<leader>fh', tel_buil.help_tags, { desc = '[F]ind [H]elp' })
    map('n', '<leader>fw', tel_buil.grep_string, { desc = '[F]ind current [W]ord' })
    map('n', '<leader>fd', tel_buil.diagnostics, { desc = '[F]ind [D]iagnostics' })
    map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[F]ind [T]odos" })

  end,
}
