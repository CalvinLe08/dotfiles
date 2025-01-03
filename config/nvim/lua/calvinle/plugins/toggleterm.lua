return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup{
            open_mapping = [[<c-\>]],  -- Toggle terminal with Ctrl+\ 
            direction = 'float',       -- Floating terminal
            float_opts = {
                border = 'rounded',      -- Rounded border
                width = 80,              -- Width of the terminal
                height = 20,             -- Height of the terminal
            }
        }

        local keymap = vim.keymap

        -- Key mapping for toggling the terminal
        keymap.set('n', '<leader>t', ':ToggleTerm<CR>', { noremap = true, silent = true })
        
        -- Key mapping to close the terminal with the Esc key when in terminal mode
        -- This will allow you to press Esc to exit terminal mode and close the terminal
        vim.cmd([[
          autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>:ToggleTerm<CR>
        ]])

    end
}
