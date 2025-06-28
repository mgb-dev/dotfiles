return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "nvim-neotest/neotest",
    "Issafalcon/neotest-dotnet",
  },
  config = function()
    local dlv_path = vim.fn.stdpath("data") .. "/mason/bin/dlv"
    local dap = require("dap")
    local dap_go = require("dap-go")
    local dap_virtual_text = require("nvim-dap-virtual-text")
    local dapui = require("dapui")
    local neotest = require("neotest")
    local neo_dotnet = require("neotest-dotnet")({
      dap = {
        args = { justMyCode = false },
      },
      dotnet_additional_args = {
        "--verbosity detailed",
      },
      discovery_root = "solution",
    })

    neotest.setup({
      adapters = {
        neo_dotnet,
      },
    })

    -- keymaps
    local set = vim.keymap.set
    -- set("n", "<leader>dt", function()
    --   neotest.run.run({ strategy = "dap" })
    -- end, { desc = "[D]ebug nearest [T]est" })

    set("n", "<leader>b", function()
      dap.toggle_breakpoint()
    end, { desc = "set [B]reakpoint" })

    set("n", "<leader>1", function()
      dap.continue()
    end, { desc = "dap continue" })

    set("n", "<leader>2", function()
      dap.step_over()
    end, { desc = "dap step_over" })

    set("n", "<leader>3", function()
      dap.step_into()
    end, { desc = "dap step_into" })

    set("n", "<leader>4", function()
      dap.step_out()
    end, { desc = "dap step_out" })

    -- Defaults settings
    dap_go.setup({
      delve = {
        path = dlv_path,
      },
    })

    dap.adapters.coreclr = {
      type = "executable",
      command = "netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.adapters.netcoredbg = {
      type = "executable",
      command = "netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input({
            prompt = "Path to dll: ",
            default = vim.fn.getcwd() .. "/build/debug/",
            completion = "file",
          })
        end,
        -- args = function()
        --   return { vim.fn.input("Arguments: ") }
        -- end,
        -- env = function()
        --   return {
        --     vim.fn.input({ prompt = "Enviroment variables", default = "", completion = "enviroment" }),
        --   }
        -- end,
      },
    }

    dapui.setup()
    dap_virtual_text.setup({})

    -- Automatic dapui opening
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
      dap.clear_breakpoints()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
      dap.clear_breakpoints()
    end
    dap.set_log_level("INFO")
  end,
}
