if empty(glob('~/.vim/autoload/plug.vim'))                                                               
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs                                               
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC                                                
endif                                                                                                    
                                                                                                         
call plug#begin()                                                                                        
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                                                      
call plug#end()                                                                                          
                                                                                                         
execute pathogen#infect()                                                                                
set autoindent showmode showmatch smartindent                                                            
set tabstop=4 shiftwidth=4 expandtab softtabstop=4                                                       
syntax on                                                                                                
set nobackup nowritebackup                                                                               
set ignorecase                                                                                           
set number                                                                                               
set noswapfile                                                                                           
set hidden                                                                                               
colorscheme delek                                                                                        
set termguicolors                                                                                        
set wildmenu                                                                                             
set colorcolumn=101                                                                                      
set history=1000                                                                                         
set ruler                                                                                                
set showcmd                                                                                              
set scrolloff=5                                                                                          
set hlsearch                                                                                             
set incsearch                                                                                            
set smartcase                                                                                            
                                                                                                         
" Nerdtree ignored file types.                                                                           
let NERDTreeIgnore=['\.pyc$', '\~$']                                                                     
                                                                                                         
" Macros                                                                                                 
let @p = 'Iimport pdb; pdb.set_trace()^['                                                                
                                                                                                         
" Keymaps                                                                                                
" For auto complete
inoremap <C-space> <C-n>                                                                                                                                            
inoremap <C-@> <C-n>                                                                                                                                                
                                                                                                                                                                    
" Flag extra white space                                                                                                                                            
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen                                                                                                        
map <Leader>] :match ExtraWhitespace /\s\+$/<cr>                                                                                                                    
map <Leader>[ :match<cr>  
