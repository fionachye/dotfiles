" Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===========
" | Plugins |
" ===========
call plug#begin()
" Fuzzy search
" Enable 'Ag' command: 'sudo apt-get install siversearch'
" Enable 'Rg' command: 'snap install ripgrep'
" Install fd-find: cargo install fd-find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Linter
Plug 'dense-analysis/ale'

" Syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'arzg/vim-colors-xcode'
Plug 'lifepillar/vim-solarized8'
Plug 'skbolton/embark'
Plug 'arcticicestudio/nord-vim'

" Display status
Plug 'bling/vim-airline'

" Airline theme for status bar
Plug 'vim-airline/vim-airline-themes'

" Display buffer number in command bar
Plug 'mihaifm/bufstop'

" Visually sees indent
Plug 'Yggdroot/indentLine'

" Csv extension
Plug 'chrisbra/csv.vim'

" Git extension
Plug 'tpope/vim-fugitive'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Intellisense
" Need to install nodejs, npm (sudo apt install nodejs npm)
" Requires most recent version of nvim
" Run :checkhealth and check what's missing
" Then do the following:
" :CocInstall coc-python
" :CocInstall coc-json
" :CocInstall coc-tsserver
" :CocInstall coc-sh
" :CocInstall coc-lua
" :CocCommand<CR> then python.setInterpreter, then set python.enableLinting to False
" :CocConfig or :CocLocalConfig, place settings in JSON
" See https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file#configuration-file-resolve
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vim Wiki
Plug 'vimwiki/vimwiki'

call plug#end()

" ====================
" | General Settings |
" ====================
filetype plugin on  " Enable file type based settings, e.g .vim/ftplugin/python.vim
set autoindent showmode showmatch smartindent autochdir
set tabstop=4 shiftwidth=4 expandtab softtabstop=4
syntax on
set nobackup nowritebackup
set ignorecase
set nowrapscan  " Do not wrap around when search reaches EOF
set number
set noswapfile
set hidden
set termguicolors
set wildmenu
set colorcolumn=101
set history=1000
set ruler
set showcmd
set scrolloff=2
set hlsearch
set incsearch
set smartcase
set cursorline

" =====================
" | Fuzzy file finder |
" =====================
set path+=**
set wildignore+=**/node_modules/**

" ==============
" | Appearance |
" ==============
" Colorscheme
colorscheme embark
set bg=dark

" ==========
" | Macros |
" ==========
let @p = "Iimport pdb; pdb.set_trace()^"
let @o = "Ifrom celery.contrib import rdb; rdb.set_trace()^"

" ==================
" | Linux Commands |
" ==================
command! FormatJSON %!python -m json.tool

"===========
"| Keymaps |
"===========
"Remap semicolon to colon
nnoremap ; :

" Remap Esc
inoremap jk <ESC>

" For auto complete
" For vim: Ctrl Space, Ctrl `
inoremap <NUL> <C-n>
" For nvim: Ctrl Space, Ctrl `
inoremap <C-Space> <C-n>
inoremap <C-n> <Nop>

" For fuzzy search
nnoremap <C-p> :FZF<Space>/home/fiona/python/<CR>
nnoremap <C-p>. :FZF<Space>.<CR>

" For cycling buffers
nnoremap <C-q> :bprev<CR>
nnoremap <C-e> :bnext<CR>

" Delete buffer without losing split
nnoremap <silent> <Leader>w :bp \| :bd #<CR>

" Refresh buffer
nnoremap <silent> <Leader>r :execute ":bufdo e!" \| syntax on<CR>

" Terminal to normal mode
tnoremap jk <C-w><S-n>  " For vim
if has("nvim")
    tnoremap jk <C-\><C-n>  " For nvim
endif

" Cycle through buffers
map <Leader>n :Bufstop<CR>
map <Leader>m :BufstopModeFast<CR>
map <Leader><BS> :noh<CR>

" Flag extra white space (Put this after setting colorscheme
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
map <Leader>] :match ExtraWhitespace /\s\+$/<CR>
map <Leader>[ :match<CR>

" Airline theme
let g:airline#extensions#tabline#enabled = 1  " Show buffers in tabs
let g:airline_theme='molokai'

" Coc Intellisense
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
let g:coc_disable_startup_warning = 1

" Vim Wiki
let g:vimwiki_url_maxsave=0  " Remove concealing urls (url shortening)
let g:vimwiki_list = [
    \ {'path': '~/wiki/', 'path_html': '~/wiki/html/'},
    \ {'path': '~/vimwiki/', 'path_html': '~/vimwiki/html'}]

" netrw
let g:netrw_banner = 0  " Remove the banner
let g:netrw_browse_split = 2  " Open files in vertical split
let g:netrw_liststyle = 3  " Tree style listing
