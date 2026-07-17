return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            icons_enabled = false,
            hide_filename_extension = false,
            -- los por defecto
            -- component_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
            -- son los a,b,c - x,y,z
            section_separators = { left = "", right = "" },
            component_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
            -- component_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
            -- component_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
            -- component_separators = { left = "", right = "" },
        },
        sections = {
            -- verison completa
            -- lualine_a = {
            -- 	"mode",
            -- 	{
            -- 		"buffers",
            -- 		icons_enabled = false,
            -- 		hide_filename_extension = false,
            -- 		use_mode_colors = false,
            -- 		-- oxocarbon
            -- 		-- buffers_color = {
            -- 		-- 	active = { bg = "#ee5396" },
            -- 		-- 	inactive = { bg = "#82cfff" },
            -- 		-- },
            -- 		symbols = {
            -- 			modified = " ●",
            -- 			alternate_file = "",
            -- 			directory = "",
            -- 		},
            -- 	},
            -- },
            -- lualine_b = { "branch", "diff", "diagnostics" },
            -- lualine_c = {},
            -- lualine_x = {},
            -- lualine_y = { "progress" },
            -- lualine_z = { "location" },

            -- minimalista
            lualine_a = { "mode" },
            lualine_b = {},
            lualine_c = { { "buffers" } },
            lualine_x = { { "filetype" } },
            lualine_y = {},
            lualine_z = {},
        },
    },
}
