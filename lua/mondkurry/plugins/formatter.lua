return {
	"mhartington/formatter.nvim",
	keys = {
		{ "<leader>F", "<cmd>Format<cr>", mode = "n", desc = "Format the file" },
	},
	config = function()
		local opts = {
			filetype = {

				cpp = {
					require("formatter.filetypes.cpp").clang_format,
				},

				python = {
					require("formatter.filetypes.python").black,
				},

				lua = {
					require("formatter.filetypes.lua").luaformat,
				},

				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		}
		require("formatter").setup(opts)
	end,
}
