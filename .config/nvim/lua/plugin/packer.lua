
return require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  -- Supermaven configuration must be INSIDE this block
  use {
      "supermaven-inc/supermaven-nvim",
      config = function()
          require("supermaven-nvim").setup({

              keymaps = {
                  accept_suggestion = "<Tab>",

                -- TODO : Find better keybinds for these
                  --  clear_suggestion = "<C-t>",
                  --    accept_word = "<C-j>",
              },
          })
      end,
  }
end)

