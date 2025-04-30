local fb_actions = require("telescope").extensions.file_browser.actions
return {
	require("telescope").setup({
		defaults = {
			file_ignore_patterns = {
				"node_modules",
			},
			border = false,
			-- sorting_strategy = "ascending",
			sorting_strategy = "descending",
			layout_config = {
				-- prompt_position = "top",
				prompt_position = "bottom",
			},
			-- hidden = true,
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
					["<esc>"] = "close",
				},
			},
		},
		pickers = {
			-- find_files = { theme = "dropdown" },
			-- oldfiles = { theme = "ivy", }
		},
		extensions = {
			file_browser = {
				theme = "ivy",
				hidden = true,
				-- disables netrw and use telescope-file-browser in its place
				-- hijack_netrw = true,
				mappings = {
					["i"] = {
						-- your custom insert mode mappings
						["<esc>"] = false,
					},
					["n"] = {
						["a"] = fb_actions.create,
						-- your custom normal mode mappings
					},
				},
			},
		},
	}),
	require("telescope").load_extension("file_browser"),
}
