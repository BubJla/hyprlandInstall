-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
	config = function()
      	  -- load the colorscheme here
      	  vim.cmd([[colorscheme tokyonight-night]])
    	  end,
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  vim.cmd([[set number]]),
  vim.cmd([[set clipboard=unnamedplus]]),
  install = { colorscheme = { "habamax" } },
  -- vim.cmd[[colorscheme tokyonight]],
  -- automatically check for plugin updates
  checker = { enabled = true },
})
