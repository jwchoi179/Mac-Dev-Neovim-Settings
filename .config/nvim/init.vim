" Fundamentals "{{{
" ---------------------------------------------------------------------
" init autocmd autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set nocompatible
set number
syntax enable
set fileencodings=utf-8,euc-kr,ms949
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
"let loaded_matchparen = 1
set shell=fish
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
"  ??????????????? ?????? ????????? ???????????? ????????? ??? ??????
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
endif

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}

" vim: set foldmethod=marker foldlevel=0:
"
"html:5,, ????????? ???????????? html ????????? ???????????? html5 ?????? ????????? ????????????.
let g:user_emmet_leader_key=','

"?????? ???????????? ???????????? ????????????prettier ??????
"?????? ?????? ??????????????? ??????????????? ??????
"Neoformat Prettier??? ???????????? ??????
"let g:prettier#autoformat = 1
"let g:prettier#autoformat_require_pragma = 0

autocmd FileType scss setl iskeyword+=@-@

let g:javascript_plugin_jsdoc = 1

" custom setting for clangformat
"let g:neoformat_cpp_clangformat = {
"    \ 'exe': 'clang-format',
"    \ 'args': ['--style="{IndentWidth: 2}"']
"\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_disabled_java = ['clangformat']

" Neformat user prettier
let g:neoformat_try_node_exe = 1

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" NerdTree Shortcuts
" ctrl + w + w ??? ??? ??? ????????? ????????????
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Show git status at NerdTree
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'???',
                \ 'Staged'    :'???',
                \ 'Untracked' :'???',
                \ 'Renamed'   :'???',
                \ 'Unmerged'  :'???',
                \ 'Deleted'   :'???',
                \ 'Dirty'     :'???',
                \ 'Ignored'   :'???',
                \ 'Clean'     :'??????',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 000000
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0

"let g:lsc_server_commands = {'java': '/Users/choijiwoong/java-language-server/dist/lang_server_mac.sh'}

lua << EOF
-- ?????? CocInstall coc-eslint??? ?????? eslint??? ?????? ?????????.
-- eslint??? jsx ????????? ??????????????? ????????? ??????
-- ????????? eslint??? quick_lint_js?????? ??? ?????? ????????? ??????
-- require('lspconfig').quick_lint_js.setup {}

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}

-- CocConfig ???????????? ????????? ?????? ????????? ???
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
-- html ????????? ?????? ???????????? ?????? ????????? ?????????
-- require'lspconfig'.html.setup{}
require'lspconfig'.emmet_ls.setup{}
require'lspconfig'.cmake.setup{}
require'lspconfig'.groovyls.setup{}
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "?",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
--require'lspconfig'.java_language_server.setup{}

EOF

" coc keymaps settings
" coc.nvim updatetime
set updatetime=300

" GoTo code navigation.
nmap <silent> hd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" Symbol renaming.
nmap <silent> gn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

