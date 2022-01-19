vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'akinsho/toggleterm.nvim'
  use 'kevinhwang91/rnvimr'
  use 'nvim-treesitter/nvim-treesitter'
  use 'mattn/emmet-vim'
  use 'airblade/vim-gitgutter'
  use 'powerman/vim-plugin-ruscmd'

  use { 'nvim-telescope/telescope.nvim', requires = {
    { 'nvim-lua/plenary.nvim' }
  }, config = function()
    require'telescope'.setup {} 
    require('telescope').load_extension('fzf')
  end, }

  require("toggleterm").setup{
    size = function(term)
      if term.direction == "horizontal" then
	return 15
      elseif term.direction == "vertical" then
	return vim.o.columns * 0.4
      end
    end,
  }
end)
