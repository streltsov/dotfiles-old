vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {"akinsho/toggleterm.nvim"}
  use {'kevinhwang91/rnvimr'}
  use {'nvim-treesitter/nvim-treesitter'}
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  local lsp_installer = require("nvim-lsp-installer")
  local lspconfig = require('lspconfig')

  -- Register a handler that will be called for all installed servers.
  -- Alternatively, you may also register handlers on specific server instances instead (see example below).
  -- lsp_installer.on_server_ready(function(server)
  --   local opts = {}

  --   -- (optional) Customize the options passed to the server
  --   -- if server.name == "tsserver" then
  --   --     opts.root_dir = function() ... end
  --   -- end

  --   -- This setup() function is exactly the same as lspconfig's setup function.
  --   -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  --   server:setup(opts)
  -- end)


  -- use {'haringsrob/nvim_context_vt', config = function() 
  -- require 'nvim_context_vt'.showDebug()
  -- end, }
  -- use 'michaelb/sniprun'
  -- require'sniprun'.setup({
  --    selected_interpreters = {},     --# use those instead of the default for the current filetype
  --    repl_enable = {},               --# enable REPL-like behavior for the given interpreters
  --    repl_disable = {},              --# disable REPL-like behavior for the given interpreters
  --
  --    interpreter_options = {         --# intepreter-specific options, see docs / :SnipInfo <name>
  --    GFM_original = {
  --      use_on_filetypes = {"markdown.pandoc"}    --# the 'use_on_filetypes' configuration key is
  --      --# available for every interpreter
  --    }
  --  },      
  --
  --  --# you can combo different display modes as desired
  --  display = {
  --    "Classic",                    --# display results in the command-line  area
  --    "VirtualTextOk",              --# display ok results as virtual text (multiline is shortened)
  --
  --    -- "VirtualTextErr",          --# display error results as virtual text
  --    -- "TempFloatingWindow",      --# display results in a floating window
  --    -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText__
  --    -- "Terminal",                --# display results in a vertical split
  --    -- "NvimNotify",              --# display with the nvim-notify plugin
  --    -- "Api"                      --# return output to a programming interface
  --  },
  --
  --  --# You can use the same keys to customize whether a sniprun producing
  --  --# no output should display nothing or '(no output)'
  --  show_no_output = {
  --    "Classic",
  --    "TempFloatingWindow",      --# implies LongTempFloatingWindow, which has no effect on its own
  --  },
  --
  --  --# customize highlight groups (setting this overrides colorscheme)
  --  snipruncolors = {
  --    SniprunVirtualTextOk   =  {bg="#66eeff",fg="#000000",ctermbg="Cyan",cterfg="Black"},
  --    SniprunFloatingWinOk   =  {fg="#66eeff",ctermfg="Cyan"},
  --    SniprunVirtualTextErr  =  {bg="#881515",fg="#000000",ctermbg="DarkRed",cterfg="Black"},
  --    SniprunFloatingWinErr  =  {fg="#881515",ctermfg="DarkRed"},
  --  },
  --
  --  --# miscellaneous compatibility/adjustement settings
  --  inline_messages = 0,             --# inline_message (0/1) is a one-line way to display messages
  --  --# to workaround sniprun not being able to display anything
  --
  --  borders = 'single'               --# display borders around floating windows
  --  --# possible values are 'none', 'single', 'double', or 'shadow'
  -- })


  use { 'nvim-telescope/telescope.nvim', requires = {
    { 'nvim-lua/plenary.nvim' }
  }, config = function()
    require'telescope'.setup {} 
    require('telescope').load_extension('fzf')
  end, }

  require("toggleterm").setup{
    -- size can be a number or function which is passed the current terminal
    size = function(term)
      if term.direction == "horizontal" then
	return 15
      elseif term.direction == "vertical" then
	return vim.o.columns * 0.4
      end
    end,
    --  open_mapping = [[<c-\>]],
    --  hide_numbers = true, -- hide the number column in toggleterm buffers
    --  shade_filetypes = {},
    --  shade_terminals = true,
    --  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    --  start_in_insert = true,
    --  insert_mappings = true, -- whether or not the open mapping applies in insert mode
    --  persist_size = true,
    --  direction = 'vertical' | 'horizontal' | 'window' | 'float',
    --  close_on_exit = true, -- close the terminal window when the process exits
    --  shell = vim.o.shell, -- change the default shell
    --  -- This field is only relevant if direction is set to 'float'
    --  float_opts = {
    --    -- The border key is *almost* the same as 'nvim_open_win'
    --    -- see :h nvim_open_win for details on borders however
    --    -- the 'curved' border is a custom border type
    --    -- not natively supported but implemented in this plugin.
    --    border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    --    width = <value>,
    --    height = <value>,
    --    winblend = 3,
    --    highlights = {
    --      border = "Normal",
    --      background = "Normal",
    --    }
    --  }
  }


  -- use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  -- require("bufferline").setup {
  --   options = {
  --     tab_size = 38,
  --     diagnostics = "nvim_lsp",
  --     show_buffer_close_icons = false,
  --     show_close_icon = false,
  --     separator_style = "thick",
  --     always_show_bufferline = false,
  --   }
  -- }
end)

-- 

