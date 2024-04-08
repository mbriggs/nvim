return {
    "nvimdev/guard.nvim",
    dependencies = {
        "nvimdev/guard-collection",
    },

    config = function()
        local ft = require("guard.filetype")

        ft("lua"):fmt("lsp"):append("stylua")

        ft("typescript,javascript,typescriptreact"):fmt("prettier")

        ft("go"):fmt({ cmd = "goimports", stdin = true })

        ft("sh"):fmt("shfmt")

        require("guard").setup({
            fmt_on_save = true,
            lsp_as_default_formatter = true,
        })
    end,
}
