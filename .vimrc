runtime! debian.vim

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

if has("syntax")
  syntax on
endif

set background=dark
set history=1000
set undolevels=1000
set suffixesadd+=.py,.go

set hidden
set list
set number

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noautoindent

set ignorecase
set smartcase
set incsearch
set hlsearch

set nosol
set noai
set mouse-=a
set laststatus=2

set foldmethod=indent
set foldlevel=99

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

nmap <silent> gx :bdelete<CR>
nmap <silent> gc :bufdo :bdelete<CR>
nmap <silent> [oo :set list number<CR>
nmap <silent> ]oo :set nolist nonumber<CR>
nmap <silent> ]oa :nohlsearch<CR>
nmap <silent> [op :set paste<CR>
nmap <silent> ]op :set nopaste<CR>
nmap <silent> gn :NERDTreeToggle<CR>
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>:noh<CR>

nmap <silent> g( i(<Esc>ea)<Esc>
nmap <silent> G( i(<Esc>eA)<Esc>

nmap <silent> g{ i{<Esc>ea}<Esc>
nmap <silent> G{ i{<Esc>eA}<Esc>

nmap <silent> g[ i[<Esc>ea]<Esc>
nmap <silent> G[ i[<Esc>eA]<Esc>

nmap <silent> g" i"<Esc>ea"<Esc>
nmap <silent> G" i"<Esc>eA"<Esc>

nmap <silent> g' i'<Esc>ea'<Esc>
nmap <silent> G' i'<Esc>eA'<Esc>

map <F12> :GoDebugStop<CR>
"map <F11> :GoDebugStep<CR>
"map <F10> :GoDebugNext<CR>
"map <F9> :GoDebugBreakpoint<CR>
"map <F8> :GoDebugHalt<CR>
map <F6> :GoDebugStart<CR>
"map <F5> :GoDebugContinue<CR>

cmap w!! w !sudo tee % > /dev/null

nnoremap j gj
nnoremap k gk
"nnoremap <TAB> zj
nnoremap <S-TAB> zk
nnoremap <silent> <Space> @=(foldlevel('.')?'zA':"\<Space>")<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" needed?
let g:skip_defaults_vim = 1
let python_highlight_all = 1

" I know, I am a slappy typist
command! Q q
command! W w

"vmap X /y<C-R>"<CR>

" vundle plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'fatih/vim-go'
Plugin 'Lokaltog/vim-powerline'
Plugin 'preservim/nerdtree'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim'
call vundle#end()

filetype on
filetype plugin on
filetype plugin indent on
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

" always show EOFs. show tabs, unless go file
set listchars=tab:▸\ ,eol:¬
autocmd FileType go set listchars+=tab:\ \ 