return {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        vim.keymap.set('n', '<leader>fr', '<cmd>FlutterRun<cr>')
        vim.keymap.set('n', '<leader>fR', '<cmd>FlutterRestart<cr>')
        vim.keymap.set('n', '<leader>fl', '<cmd>FlutterLogToggle<cr>')
        vim.keymap.set('n', '<leader>fq', '<cmd>FlutterQuit<cr>')

        require('flutter-tools').setup({})
    end,
}
