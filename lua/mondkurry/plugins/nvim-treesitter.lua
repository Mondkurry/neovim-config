return{
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {"c","cmake","python","lua","cpp"},
        highlight = {
            enable = true
        },
        indent = {
            enable = true
        }
    },
}
