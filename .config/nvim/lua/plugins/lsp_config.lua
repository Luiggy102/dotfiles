-- configuración de servidores lsp (go, web, c#, sql, latex, etc) y sus atajos
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local mapsOpts = { noremap = true, silent = true }

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufnr = args.buf
                local opts = function(desc)
                    return { buffer = bufnr, noremap = true, silent = true, desc = desc }
                end
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("gD"))
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("gi"))
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("gr"))
                vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts("<space>D"))

                ------------ reemplazos de lsp saga -----------------------
                vim.keymap.set("n", "<C-<kPoint>>", ":Lspsaga code_action<cr>")
                vim.keymap.set("n", "gd", ":Lspsaga goto_definition<cr>", mapsOpts)
                vim.keymap.set("n", "K", ":Lspsaga hover_doc<cr>", mapsOpts)
                vim.keymap.set("n", "<space>rn", ":Lspsaga rename<cr>", mapsOpts)
            end,
        })

        ----------- nuevo para suprimir las advertencias virtual tex
        vim.diagnostic.config({
            virtual_text = true,
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        vim.lsp.config("*", {
            capabilities = capabilities,
        })

        vim.lsp.config("emmet_ls", {
            filetypes = {
                "css",
                "eruby",
                "html",
                "javascript",
                "javascriptreact",
                "less",
                "sass",
                "scss",
                "svelte",
                "pug",
                "typescriptreact",
                "vue",
            },
            init_options = {
                html = {
                    options = {
                        ["bem.enabled"] = true,
                    },
                },
            },
        })

        vim.lsp.config("angularls", {})

        vim.lsp.config("buf_ls", {
            filetypes = { "proto" },
        })

        vim.lsp.config("sqlls", {})

        vim.lsp.config("bashls", {})

        vim.lsp.config("docker_compose_language_service", {
            filetypes = { "yaml" },
        })

        vim.lsp.config("yamlls", {
            filetypes = { "yaml" },
        })

        vim.lsp.config("dockerls", {})

        vim.lsp.config("html", {
            filetypes = { "html" },
        })

        vim.lsp.config("cssls", {})

        vim.lsp.config("ts_ls", {
            settings = {
                typescript = {
                    format = { indentSize = 5, tabSize = 5, convertTabsToSpaces = true },
                },
                javascript = {
                    format = { indentSize = 5, tabSize = 5, convertTabsToSpaces = true },
                },
            },
        })

        vim.lsp.config("clangd", {
            filetypes = { "c", "cpp" },
        })

        vim.lsp.config("jsonls", {})

        vim.lsp.config("texlab", {})

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        })

        vim.lsp.config("ltex", {
            filetypes = { "latex", "tex" },
            settings = {
                ["ltex"] = {
                    enabled = { "latex", "bibtex", "tex" },
                    language = "es",
                },
            },
        })

        vim.lsp.enable({
            "emmet_ls",
            "angularls",
            "buf_ls",
            "sqlls",
            "bashls",
            "docker_compose_language_service",
            "yamlls",
            "dockerls",
            "html",
            "cssls",
            "ts_ls",
            "clangd",
            "jsonls",
            "texlab",
            "lua_ls",
            "ltex",
        })
    end,
}
