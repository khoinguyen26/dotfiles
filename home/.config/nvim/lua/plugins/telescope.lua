return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    cmd = "Telescope", -- Lazy load on command
    keys = {        -- Lazy load on these keymaps
        { "<leader>ff", "<cmd>Telescope find_files<cr>",           desc = "Telescope find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",            desc = "Telescope live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",              desc = "Telescope buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",            desc = "Telescope help tags" },
        { "<leader>gd", "<cmd>Telescope lsp_definitions<cr>",      desc = "Find list of definitions" },
        { "<leader>gi", "<cmd>Telescope lsp_implementations<cr>",  desc = "Find list of implementations" },
        { "<leader>gr", "<cmd>Telescope lsp_references<cr>",       desc = "Find list of references" },
        { "<leader>gy", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Find list of type definitions" },
    },
    opts = {
        pickers = {
            find_files = {
                hidden = true
            },
            git_files = {
                hidden = true
            },
        },
        defaults = {
            file_ignore_patterns = {
                "node_modules/*",
                "^.git/"
            },
            path_display = { "filename_first" },
        }
    },
}
