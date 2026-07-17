return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        -- compartir los snippets de sql con mysql
        require("luasnip").filetype_extend("mysql", { "sql" })
        require("luasnip").filetype_extend("plsql", { "sql" })
        require("luasnip").filetype_extend("javascriptreact", { "html" })
        require("luasnip").filetype_extend("javascriptreact", { "css" })
        require("luasnip").filetype_extend("typescript", { "html" })
        require("luasnip").filetype_extend("typescript", { "css" })
        require("luasnip").filetype_extend("html", { "css" })
        -- require("luasnip").filetype_extend("htmlangular", { "html" })
        -- require("luasnip").filetype_extend("htmlangular", { "css" })
    end,
}
