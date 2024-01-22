return {
  "nvim-lualine/lualine.nvim", 
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- configure lualine with modified theme
    lualine.setup({
      options = {
      	theme = "catppuccin",
	icons_enabled = true,
        component_separators = '|',
	section_separators = { left = '', right = '' },
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
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}

