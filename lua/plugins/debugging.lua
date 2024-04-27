return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python",
	},
    config = function()
        require("dapui").setup()
		require("dap-go").setup()
        require("dap-python").setup('~/.virtualenvs/debugpy/bin/python')

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

    -- Cpp debugger setup
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/home/wenbo/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
    }

    -- Cpp debugger configuration
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
      },
      {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
      },
    }

  -- Set C++ configuration to C
  dap.configurations.c = dap.configurations.cpp

  vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
  vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''}) 

  -- keymap
  vim.keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>")
  vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
  vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
  vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
end,
}
