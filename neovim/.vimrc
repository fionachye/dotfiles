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

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'arzg/vim-colors-xcode'
Plug 'lifepillar/vim-solarized8'

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
" :CocCommand<CR> then python.setInterpreter, then set python.enableLinting to False
" :CocConfig or :CocLocalConfig, place settings in JSON
" See https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file#configuration-file-resolve
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ====================
" | General Settings |
" ====================
filetype plugin on  " Enable file type based settings, e.g .vim/ftplugin/python.vim
set autoindent showmode showmatch smartindent
set tabstop=4 shiftwidth=4 expandtab softtabstop=4
syntax on
set nobackup nowritebackup
set ignorecase
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

" ==============
" | Appearance |
" ==============
" Colorscheme
colorscheme solarized8_high
set bg=dark

" ==========
" | Macros |
" ==========
let @p = "Iimport pdb; pdb.set_trace()^"

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
nnoremap <C-p> :FZF<Space>/opt/ff/<CR>
nnoremap <C-p>. :FZF<Space>.<CR>

" For cycling buffers
nnoremap <C-Left> :bprev<CR>
nnoremap <C-Right> :bnext<CR>

" Delete buffer without losing split
nnoremap <silent> <Leader>w :bp \| :bd #<CR>

" Refresh buffer
nnoremap <silent> <Leader>r :execute ":bufdo e!" \| syntax on<CR>

" Termninal to normal mode
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

