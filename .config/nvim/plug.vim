if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif
call plug#begin()

Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shime/vim-livedown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'sbdchd/neoformat'
Plug 'preservim/nerdtree'
Plug 'mfussenegger/nvim-jdtls'
Plug 'natebosch/vim-lsc'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tveskag/nvim-blame-line'

if has("nvim")
  Plug 'alvan/vim-closetag'
  Plug 'mattn/emmet-vim'
  Plug 'dense-analysis/ale'
  Plug 'mfussenegger/nvim-lint'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'tami5/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ryanoasis/vim-devicons'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
endif

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()

