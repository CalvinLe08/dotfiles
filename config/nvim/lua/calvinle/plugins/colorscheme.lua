return {
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
  --     vim.cmd([[colorscheme duskfox]])
  --   end,
  -- },
  {
    "catppuccin/nvim", -- Catppuccin theme
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = false, -- Enable transparency
        flavour = "mocha", -- Choose your preferred flavor: latte, frappe, macchiato, mocha
        styles = {
          comments = { "italic" },
          functions = { "bold" },
          keywords = { "italic", "bold" },
        },
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
          },
        },
      })
      -- Uncomment to set Catppuccin as default
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
