return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>, {}')
        vim.keymap.set('n', '<S-h>', '<C-w><Left>', {noremap = true, silent = true })
        vim.keymap.set('n', '<S-l>', '<C-w><Right>', {noremap = true, silent = true })
    end
}
