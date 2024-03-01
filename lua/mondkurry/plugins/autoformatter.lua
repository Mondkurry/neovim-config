return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- Everything in opts will be passed to setup()
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { { "prettierd", "prettier" } },
		},
		-- Set up format-on-save
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			else
				return {
					quiet = true,
					lsp_fallback = true,
					timeout = 500,
				}
			end
		end,
		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "--use-tabs" },
			},
		},
	},

	init = function()
		vim.opt.formatexpr = [[v:lua.require("conform").formatexpr()]]
		-- Add commands to toggle format on save
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, { desc = "Disable format on save", bang = true })
		vim.api.nvim_create_user_command("FormatEnable", function(args)
			if args.bang then
				vim.b.disable_autoformat = false
			else
				vim.g.disable_autoformat = false
			end
		end, { desc = "Enable format on save", bang = true })
		vim.api.nvim_create_user_command("FormatToggle", function(args)
			if args.bang then
				vim.b.disable_autoformat = not vim.b.disable_autoformat
			else
				vim.g.disable_autoformat = not vim.g.disable_autoformat
			end
		end, { desc = "Toggle format on save", bang = true })
	end,
}
