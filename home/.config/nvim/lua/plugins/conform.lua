return {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
            json = { "prettierd" },
            jsonc = { "prettierd" },
            yaml = { "prettierd" },
            markdown = { "prettierd" },
            html = { "prettierd" }
        },
        -- Set up format on save
        format_after_save = {
            timeout_ms = 500,
            lsp_format = "never"
            -- lsp_fallback = true
        },
    },
}
