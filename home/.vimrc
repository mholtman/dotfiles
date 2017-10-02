set hidden
set ts=2
set sw=2
set ai
set nu
set expandtab
set nobackup
set noswapfile
set backspace=indent,eol,start
autocmd BufWritePre * %s/\s\+$//e
nnoremap <F5> :CtrlPBuffer<CR>

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'NLKNguyen/papercolor-theme'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set t_Co=256
set term=screen-256color
set background=dark
colorscheme PaperColor
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled = 1

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END
