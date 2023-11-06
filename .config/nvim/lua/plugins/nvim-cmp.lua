local cmp = require 'cmp'
local kind_icons = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = " ",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = " ",
    Misc = " ",
}
return {
    require("luasnip.loaders.from_vscode").lazy_load({
        paths = { string.format("%s/.local/share/nvim/lazy/friendly-snippets/", os.getenv("HOME")) } }),
    vim.keymap.set({ "i" }, "<C-K>", function() require('luasnip').expand() end, { silent = true }),
    vim.keymap.set({ "i", "s" }, "<C-L>", function() require('luasnip').jump(1) end, { silent = true }),
    vim.keymap.set({ "i", "s" }, "<C-J>", function() require('luasnip').jump(-1) end, { silent = true }),
    vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if require('luasnip').choice_active() then
            require('luasnip').change_choice(1)
        end
    end, { silent = true }),

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'nvim_lua' },
            { name = 'npm' },
            { name = 'path' },
            { name = 'buffer',    keyword_lenght = 3 },
            {
                name = 'spell',
                option = {
                    keep_all_entries = false,
                    enable_in_context = function()
                        return true
                    end,
                },
            },
            -- { name = 'vimtex'},
            -- {
            --     name = "latex_symbols",
            --     option = {
            --         strategy = 0, -- mixed
            --     },
            -- },
        }),
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snippet]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                })[entry.source.name]
                return vim_item
            end,
        },
        completion = {
            completeopt = 'menu,menuone,noinsert'
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        experimental = {
            ghost_text = true
        },
    }),

    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            { name = 'git' },
            { name = 'buffer' },
        })
    }),

    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    }),

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    }),
}
