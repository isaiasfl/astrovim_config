return {

 -- -------------- Tema NVChad --

 default_theme = {
    colors = function(C)
      C.telescope_green = C.green
      C.telescope_red = C.red
      C.telescope_fg = C.fg
      C.telescope_bg = C.black_1
      C.telescope_bg_alt = C.bg_1
      return C
    end,
    highlights = function(hl)
      local C = require "default_theme.colors"
      hl.TelescopeBorder = { fg = C.telescope_bg_alt, bg = C.telescope_bg }
      hl.TelescopeNormal = { bg = C.telescope_bg }
      hl.TelescopePreviewBorder = { fg = C.telescope_bg, bg = C.telescope_bg }
      hl.TelescopePreviewNormal = { bg = C.telescope_bg }
      hl.TelescopePreviewTitle = { fg = C.telescope_bg, bg = C.telescope_green }
      hl.TelescopePromptBorder = { fg = C.telescope_bg_alt, bg = C.telescope_bg_alt }
      hl.TelescopePromptNormal = { fg = C.telescope_fg, bg = C.telescope_bg_alt }
      hl.TelescopePromptPrefix = { fg = C.telescope_red, bg = C.telescope_bg_alt }
      hl.TelescopePromptTitle = { fg = C.telescope_bg, bg = C.telescope_red }
      hl.TelescopeResultsBorder = { fg = C.telescope_bg, bg = C.telescope_bg }
      hl.TelescopeResultsNormal = { bg = C.telescope_bg }
      hl.TelescopeResultsTitle = { fg = C.telescope_bg, bg = C.telescope_bg }
      return hl
    end,
  },



-- -- Configuración para que cuando se cierre el último buffer se abra de nuevo el menú siempre ----
  polish = function()
    local function alpha_on_bye(cmd)
      local bufs = vim.fn.getbufinfo { buflisted = true }
      vim.cmd(cmd)
      if require("core.utils").is_available "alpha-nvim" and not bufs[2] then
        require("alpha").start(true)
      end
    end
    vim.keymap.del("n", "<leader>c")
    if require("core.utils").is_available "bufdelete.nvim" then
      vim.keymap.set("n", "<leader>c", function()
        alpha_on_bye "Bdelete!"
      end, { desc = "Close buffer" })
    else
      vim.keymap.set("n", "<leader>c", function()
        alpha_on_bye "bdelete!"
      end, { desc = "Close buffer" })
    end
  end,


}
