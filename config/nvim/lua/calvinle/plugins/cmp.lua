return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",   -- LSP source for nvim-cmp
        "L3MON4D3/LuaSnip",       -- Snippet engine
        "saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
    },
    config = function()
        -- Load required modules
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- Configure nvim-cmp
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- Use LuaSnip for expanding snippets
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
                ["<C-e>"] = cmp.mapping.abort(),                   -- Abort completion
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()                     -- Next item in the list
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()                   -- Expand or jump in snippets
                    else
                        fallback()                                 -- Default <Tab> behavior
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()                     -- Previous item in the list
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)                           -- Jump backward in snippets
                    else
                        fallback()                                 -- Default <S-Tab> behavior
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },  -- LSP completions
                { name = "luasnip" },   -- Snippet completions
            }),
        })

        -- Enable LSP capabilities
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        -- Setup LSP servers
        local servers = { "gopls" } -- Add more servers as needed
        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                capabilities = capabilities,
            })
        end
    end,
}
