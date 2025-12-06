-- return {
-- 	{
-- 		"williamboman/mason.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 	},
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		lazy = false,
-- 		opts = {
-- 			auto_install = true,
-- 		},
-- 	},
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		lazy = false,
-- 		config = function()
-- 			local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- 			local lspconfig = require("lspconfig")
--
-- 			lspconfig.tsserver.setup({ capabilities = capabilities })
-- 			lspconfig.solargraph.setup({ capabilities = capabilities })
-- 			lspconfig.html.setup({ capabilities = capabilities })
-- 			lspconfig.lua_ls.setup({ capabilities = capabilities })
--
-- 			-- Keymaps
-- 			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- 			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
-- 			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
-- 			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
-- 			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
-- 			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
-- 			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
--
-- 			-- Diagnostics configuration
-- 			vim.diagnostic.config({
-- 				virtual_text = {
-- 					severity = { min = vim.diagnostic.severity.ERROR }, -- inline only for errors
-- 					prefix = "●",
-- 				},
-- 				signs = {
-- 					severity = { min = vim.diagnostic.severity.ERROR }, -- signs only for errors
-- 				},
-- 				underline = {
-- 					severity = { min = vim.diagnostic.severity.WARN }, -- underline warnings + errors
-- 				},
-- 				update_in_insert = false,
-- 				severity_sort = true,
-- 				float = {
-- 					border = "rounded",
-- 					source = "always",
-- 				},
-- 			})
--
-- 			-- Highlight styles
-- 			vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "Red", bold = true })
-- 			vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { underline = true, sp = "Yellow" })
-- 			vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {})
-- 			vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {})
-- 		end,
-- 	},
-- }

-- return {
-- 	{
-- 		"williamboman/mason.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 	},
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		lazy = false,
-- 		opts = {
-- 			auto_install = true,
-- 		},
-- 	},
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		lazy = false,
-- 		config = function()
-- 			local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- 			local lspconfig = require("lspconfig")
--
-- 			-- Setup LSP servers
-- 			lspconfig.tsserver.setup({ capabilities = capabilities })
-- 			lspconfig.solargraph.setup({ capabilities = capabilities })
-- 			lspconfig.html.setup({ capabilities = capabilities })
-- 			lspconfig.lua_ls.setup({ capabilities = capabilities })
--
-- 			-- Keymaps
-- 			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- 			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
-- 			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
-- 			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
-- 			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
-- 			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
-- 			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
--
-- 			-- Diagnostic icons
-- 			local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
-- 			for type, icon in pairs(signs) do
-- 				local hl = "DiagnosticSign" .. type
-- 				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- 			end
--
-- 			-- Diagnostics configuration
-- 			vim.diagnostic.config({
-- 				virtual_text = {
-- 					severity = { min = vim.diagnostic.severity.WARN }, -- inline text for errors & warnings
-- 					prefix = "●",
-- 					spacing = 2,
-- 				},
-- 				signs = {
-- 					severity = { min = vim.diagnostic.severity.WARN }, -- icons for errors & warnings
-- 				},
-- 				underline = {
-- 					severity = { min = vim.diagnostic.severity.WARN }, -- underline for errors & warnings
-- 				},
-- 				update_in_insert = false,
-- 				severity_sort = true,
-- 				float = {
-- 					border = "rounded",
-- 					source = "always",
-- 				},
-- 			})
--
-- 			-- Highlight styles
-- 			vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "Red", bold = true })
-- 			vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { underline = true, sp = "Yellow" })
-- 			vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {})
-- 			vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {})
--
-- 			-- Optional: disable inlay hints (docstring-like info)
-- 			if vim.lsp.inlay_hint then
-- 				vim.lsp.inlay_hint.enable(false)
-- 			end
-- 		end,
-- 	},
-- }
--
return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
        -- Important: Use the `ensure_installed` table to pre-configure servers
        -- We will use the new name `ts_ls` here!
        ensure_installed = { "ts_ls", "solargraph", "html", "lua_ls" },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            -- **FIX 1: Removed local lspconfig = require("lspconfig")**
            -- and removed direct calls to lspconfig.server_name.setup({})
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Use Mason's utility to set up the installed servers
            require("mason-lspconfig").setup({
                -- This function will be called for all installed servers
                -- It handles the setup process, eliminating the need for manual `lspconfig.server.setup()` calls.
                handlers = {
                    -- Set up servers with the default configuration
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                    
                    -- You can add special configuration for specific servers here
                    -- Example for 'lua_ls' (if needed)
                    -- ["lua_ls"] = function()
                    --    require("lspconfig").lua_ls.setup({
                    --        capabilities = capabilities,
                    --        settings = {
                    --            Lua = { runtime = { version = "LuaJIT" } },
                    --        },
                    --    })
                    -- end,
                },
            })

            -- The rest of your configuration (keymaps, diagnostics) remains valid.

            -- Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

            -- Diagnostic icons
            local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- Diagnostics configuration
            vim.diagnostic.config({
                virtual_text = {
                    severity = { min = vim.diagnostic.severity.WARN }, -- inline text for errors & warnings
                    prefix = "●",
                    spacing = 2,
                },
                signs = {
                    severity = { min = vim.diagnostic.severity.WARN }, -- icons for errors & warnings
                },
                underline = {
                    severity = { min = vim.diagnostic.severity.WARN }, -- underline for errors & warnings
                },
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                },
            })

            -- Highlight styles
            vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "Red", bold = true })
            vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { underline = true, sp = "Yellow" })
            vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {})
            vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {})

            -- Optional: disable inlay hints (docstring-like info)
            if vim.lsp.inlay_hint then
                vim.lsp.inlay_hint.enable(false)
            end
        end,
    },
}
