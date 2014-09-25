" General
let mapleader = ','
let g:mapleader = ','

set directory=~/.vim/swap,.
set backspace=0
set softtabstop=4
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set sw=4
set bg=dark
set ai
set number
set ruler
set hlsearch
set cc=80,100
set cursorline
syntax on

execute pathogen#infect()

" Vim clipboard to OSX clipboard
set clipboard=unnamed

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
match ExtraWhitespace /\s\+$\| \+\ze\t/
match ExtraWhitespace /[^\t]\zs\t\+/

" highlight PreBracketSpaces ctermbg=green guibg=green
" match PreBracketSpaces /\w\s(/

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

au BufReadPost *inc set filetype=php
au BufReadPost *module set filetype=php
au BufReadPost *mako set filetype=html
au BufReadPost *less set filetype=less
au BufReadPost *py.* set filetype=python

if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\   " Filename
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=%h%m%r%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

:nmap <F1> <nop>
:imap <F1> <nop>

" window navigation
:imap <silent> <C-w> <C-o><C-w>
"up
:map <silent> <C-k> :wincmd k<CR>
"down
:map <silent> <C-j> :wincmd j<CR>
"left
:map <silent> <C-h> :wincmd h<CR>
"right
:map <silent> <C-l> :wincmd l<CR>

" window sizing
" decrease
:map <silent> <leader>- <C-W>-

:map <silent> <leader>p :set invpaste<CR>
:map <silent> <leader>n :set invnumber<CR>

" window splitting
:nmap <leader>s<right> :botright vnew<CR>
:nmap <leader>sh :leftabove  vnew<CR>
:nmap <leader>sl :rightbelow vnew<CR>

" swap windows
:nmap <leader>w <C-w>r<CR>

" diff commands
:nmap <leader>dg :diffget<CR>
:nmap <leader>dp :diffput<CR>

" Prettify JSON using python
:nmap <leader>j :%!python -m json.tool<CR>

" Change case for the current word
:nmap <leader>U gUiw
:nmap <leader>u guiw

nnoremap <space> za

" Disable K
noremap K <NOP>

" Kill all trailing whitespace with one keypress!
:map <F3> :%s/\s\+$//g<cr>

filetype plugin on

" Flake 8
autocmd BufWritePost *.py call Flake8()
let g:flake8_max_line_length=99
" Ignore over-indentation error
let g:flake8_ignore="E126,F403,E712,E711"
