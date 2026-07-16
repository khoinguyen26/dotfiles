return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- use main branch for neovim 0.12+ compatibility
    build = ":TSUpdate",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {
                enable = true
            }
        }
    },
    config = function()
        -- Use git to avoid tarball extraction issues
        require("nvim-treesitter.install").prefer_git = true
        -- nvim-treesitter 1.0+ uses a new API
        require("nvim-treesitter").setup({
            ensure_installed = {
                "lua",
                "typescript",
                "tsx",
                "go",
                "c_sharp"
            },
            auto_install = false,
            highlight = {
                enable = true,
            },
        })
    end,
}
