set hidden
set ts=2
set sw=2
set ai
set nu
set expandtab
set nobackup
set noswapfile
set backspace=indent,eol,start

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'elixir-lang/vim-elixir'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'testdouble/standard'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'

call plug#end()

set t_Co=256
set term=screen-256color
set background=dark
colorscheme PaperColor
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:ale_linters = {
      \ 'ruby': ['standardrb', 'rubocop'],
      \ 'javascript': ['eslint'],
      \}

let g:ale_fixers = {
      \ 'ruby': ['standardrb'],
      \}
let g:ale_fix_on_save = 1
let g:deoplete#enable_at_startup = 1

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END
