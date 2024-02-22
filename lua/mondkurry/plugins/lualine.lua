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
				table.insert(c, client.name)
			end
			return "  " .. table.concat(c, "|")
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

