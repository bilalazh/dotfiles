
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

                  -- Not sure if these have conlficts or not 
                    clear_suggestion = "<Esc>",
                      accept_word = "<C-s>",
              },
            -- Ignore filetypes using  
              ignore_filetypes = {
              cpp = false,

              },
          })
      end,
  }
end
)

