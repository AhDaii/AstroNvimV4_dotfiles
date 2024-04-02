local prefix = "<Leader>x"
local maps = {n = {}}
local icon = require('astronvim.config').icons_enabled and "󱍼 " or ""
maps.n[prefix] = {desc = icon .. "Trouble"}
require("astrocore").set_mappings(maps)
return {
    {
        "folke/trouble.nvim",
        cmd = {"TroubleToggle", "Trouble"},
        keys = {
            {
                prefix .. "w",
                "<cmd>TroubleToggle workspace_diagnostics<cr>",
                desc = "Workspace Diagnostics (Trouble)"
            }, {
                prefix .. "d",
                "<cmd>TroubleToggle document_diagnostics<cr>",
                desc = "Document Diagnostics (Trouble)"
            }, {
                prefix .. "l",
                "<cmd>TroubleToggle loclist<cr>",
                desc = "Location List (Trouble)"
            }, {
                prefix .. "q",
                "<cmd>TroubleToggle quickfix<cr>",
                desc = "Quickfix List (Trouble)"
            }
        },
        opts = {
            use_diagnostic_signs = true,
            action_keys = {close = {"q", "<esc>"}, cancel = "<c-e>"}
        }
    }, {
        "folke/edgy.nvim",
        optional = true,
        opts = function(_, opts)
            if not opts.bottom then opts.bottom = {} end
            table.insert(opts.bottom, "Trouble")
        end
    }, {
        "catppuccin/nvim",
        optional = true,
        opts = {integrations = {lsp_trouble = true}}
    }
}
