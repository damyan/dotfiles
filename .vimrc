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

nmap <silent> gc :bufdo :bd<CR>
nmap <silent> gq :nohlsearch<CR>
nmap <silent> gl :set list! number! <CR> && :IndentLinesToggle <CR>
nmap <silent> gp :set paste!<CR>
nmap <silent> gn :NERDTreeToggle<CR>
nmap <silent> gx :bufdo :bd<CR>
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>:noh<CR>

nmap <silent> g( i(<Esc>ea)<Esc>
nmap <silent> g{ i{<Esc>ea}<Esc>
nmap <silent> g[ i[<Esc>ea]<Esc>
nmap <silent> g" i"<Esc>ea"<Esc>
nmap <silent> g' i'<Esc>ea'<Esc>


cmap w!! w !sudo tee % > /dev/null

nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>
nmap <C-x> :bd<CR>

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

