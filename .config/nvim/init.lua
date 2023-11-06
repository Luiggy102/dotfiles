-- ajustes
require("ajustes")
-- mapeados
require("mapeados")
-- manejador de paquetes
require("lazy_nvim")

require("gruvbox").setup({
overrides = {
		SignColumn = { link = "Normal" },
		GruvboxGreenSign = { bg = "" },
		GruvboxOrangeSign = { bg = "" },
		GruvboxPurpleSign = { bg = "" },
		GruvboxYellowSign = { bg = "" },
		GruvboxRedSign = { bg = "" },
		GruvboxBlueSign = { bg = "" },
		GruvboxAquaSign = { bg = "" },
	},
})
vim.cmd("colorscheme gruvbox")
