return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- function to get lsp
		local clients_lsp = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.buf_get_clients(bufnr)

			if next(clients) == nil then
				return ""
			end

			local c = {}
			for _, client in pairs(clients) do
        if client.name ~= "copilot" then
          table.insert(c, client.name)
        end
			end
			return " " .. table.concat(c, "")
		end

    -- Other Lualine configurations
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- configure lualine with modified theme
    lualine.setup({
      options = {
      	theme = "catppuccin",
	      icons_enabled = true,
        component_separators = '|',
        globalstatus = true,
	      section_separators = { left = '', right = '' },
	      -- section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { 'copilot',
            -- Default values
            symbols = {
                status = {
                    icons = {
                        enabled = "",
                        sleep = "",   -- auto-trigger disabled
                        disabled = "",
                        warning = "",
                        unknown = ""
                    },
                    hl = {
                        enabled = "#50FA7B",
                        sleep = "#AEB7D0",
                        disabled = "#6272A4",
                        warning = "#FFB86C",
                        unknown = "#FF5555"
                    }
                },
                spinners = require("copilot-lualine.spinners").dots,
                spinner_color = "#6272A4"
            },
            show_loading = true,
            show_colors = true,
          },
          -- { "fileformat" },
          { "filetype" },
          { clients_lsp },
        },
      },
    })
  end,
}


