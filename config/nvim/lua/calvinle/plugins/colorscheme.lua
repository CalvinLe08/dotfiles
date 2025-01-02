return {
    {
        "AlexvZyl/nordic.nvim",
        priority = 1000, -- Ensure it loads first
        config = function()
            require('nordic').setup({
                on_palette = function(palette) end,
                after_palette = function(palette) end,
                bold_keywords = false,
                italic_comments = true,
                transparent = {
                    bg = false,
                    float = false,
                },
                bright_border = false,
                reduced_blue = true,
                swap_backgrounds = false,
                cursorline = {
                    bold = false,
                    bold_number = true,
                    theme = 'light',
                    blend = 0.85,
                },
                noice = {
                    style = 'classic',
                },
                telescope = {
                    style = 'flat',
                },
                leap = {
                    dim_backdrop = false,
                },
                ts_context = {
                    dark_background = true,
                }
            })
            vim.cmd([[colorscheme nordic]]) -- Set Nordic as the default colorscheme
        end,
    }
    -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000, -- Ensure this loads first
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "night", -- Default style
  --       transparent = false, -- Enable transparency
  --       styles = {
  --         sidebars = "transparent", -- Transparent sidebars
  --         floats = "transparent", -- Transparent floating windows
  --       },
  --     })
  --     -- Set Tokyonight as the default colorscheme
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },
  -- {
  --   "EdenEast/nightfox.nvim", -- Nightfox theme
  --   priority = 1000,
  --   config = function()
  --     require("nightfox").setup({
  --       options = {
  --         transparent = false, -- Enable transparency
  --         styles = {
  --           comments = "italic",
  --           keywords = "bold",
  --           functions = "italic,bold",
  --         },
  --     },
  --     })
  --     -- Uncomment to set Nordfox as default
  --     vim.cmd([[colorscheme Nordfox]])
  --   end,
  -- },
  -- {
  --   "catppuccin/nvim", -- Catppuccin theme
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     require("catppuccin").setup({
  --       transparent_background = false, -- Enable transparency
  --       flavour = "mocha", -- Choose your preferred flavor: latte, frappe, macchiato, mocha
  --       styles = {
  --         comments = { "italic" },
  --         functions = { "bold" },
  --         keywords = { "italic", "bold" },
  --       },
  --       integrations = {
  --         treesitter = true,
  --         native_lsp = {
  --           enabled = true,
  --           virtual_text = {
  --             errors = { "italic" },
  --             hints = { "italic" },
  --             warnings = { "italic" },
  --             information = { "italic" },
  --           },
  --         },
  --       },
  --     })
  --     -- Uncomment to set Catppuccin as default
  --     vim.cmd([[colorscheme catppuccin]])
  --   end,
  -- },
}
