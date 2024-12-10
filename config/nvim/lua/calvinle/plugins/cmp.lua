return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }),
        })

        -- Enable LSP capabilities
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        local servers = { "gopls",
        -- "rust_analyzer", "clangd", "pyright", "jdtls" 
        }
        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                capabilities = capabilities,
            })
        end
    end,
}
