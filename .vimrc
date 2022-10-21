set mouse=
set encoding=utf-8
set fileencodings=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac
set number
set cursorline
set cursorcolumn            "現在の行を強調表示（縦）
set tabstop=2
set autoindent
set smartindent
set shiftwidth=2
set expandtab
set showmatch
set title
set statusline=%{F}
set noswapfile
set backspace=indent,eol,start
set nocompatible
set clipboard=unnamed,autoselect
set ignorecase
set hlsearch
set termguicolors
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set wildignore=.git/**,node_modules/**,docker/**
set re=0

call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'blueshirts/darcula'
  Plug 'joshdick/onedark.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'haishanh/night-owl.vim'
  Plug 'alvan/vim-closetag'
  Plug 'gre/play2vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'Yggdroot/indentLine'
  Plug 'jacoborus/tender.vim'
call plug#end()


syntax on

" ========= Color Scheme
" colorscheme nord
" colorscheme night-owl
" colorscheme onedark
" colorscheme darcula
colorscheme tender

" ========== Nerdtree Configuration
" https://stackoverflow.com/questions/4226905/vim-nerdtree-not-recovered-in-session-restore
function s:mksessionForcely()
  if (filereadable("Session.vim")) | mksession! Session.vim | endif
endfunction
function s:restoreSession()
  if (filereadable("Session.vim")) | source Session.vim | endif
endfunction

augroup vimrc_autocmd
  autocmd!
  " Save session on quitting Vim
  autocmd VimLeave * NERDTreeClose
  autocmd VimLeave * call s:mksessionForcely()
  " Restore session on starting Vim
  autocmd VimEnter * call s:restoreSession()
  autocmd VimEnter * NERDTree
  " open nerdtree when vim opned
  " autocmd vimenter * NERDTree
  " autocmd TabNew * call timer_start(0, { -> execute('NERDTree') })
  " close nerdtree automatically when vim closed
  " autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
augroup END

" create new tab
noremap  <Leader><C-t> :tabnew<Enter>

" Split window
nnoremap <Leader>vs :vsplit<Return>
nnoremap <Leader>s  :split<Return>

" keymap
" ff - search by file name
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" rg - search by characters in all files
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
\ <bang>0)

" =========== terme
if (has("termguicolors"))
  set termguicolors
endif

if !has('gui_running')
  set t_Co=256
endif

" align close tag & indent
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>A

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"-------------------------------------------------------------------------------
" シンタックスハイライトの有効化・80文字でラインを赤で可視化
syntax enable
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=+1
  " プログラミング言語のfiletypeに合わせる
  autocmd FileType sh,vim,sql,scala,html,css,scss,js,ts,vue setlocal textwidth=80
endif

