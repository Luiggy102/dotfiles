-- resalta códigos de color (hex, rgb, etc) con su color real
return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup()
    end,
}
