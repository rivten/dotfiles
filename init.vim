" BY HUGO VIALA.
"
" This is my vimrc file.
" There are two plugins that might need direct install :
" - zeux/qgrep
" - tek256/simple-dark I think vundle also needs to be installed manually
"
" Also, this might only work in neovim. Not sure at all about pure vanilla vim
" Now, the whole windows/linux stuff starts to appear.
" 
" ON WINDOWS :
" All plugins should be located in C:\Users\my_user\vimfiles\.
" THIS file should be located in C:\Users\my_user\AppData\Local\nvim\init.vim
"
" ON LINUX :
" All plugins should be located in ~/.vim
" THIS file should be located in ~/.config/nvim/init.vim
"
" VIM AND NOT NEOVIM
" ON WINDOWS :
" THIS file should be located in C:\Users\my_users\_vimrc (_vimrc is the name)
" ON LINUX :
" THIS file should be located in ~/.vimrc
"
" QGREP ON WINDOWS
" The qgrep files should be placed in 
"   C:\Users\hviala\vimfiles\pack\plugins\start
" You should create a qgrep folder in there and put everything that is inside
" the qgrep vim/ directory.
" Also, you should compile the DLL and put in inside this folder. 
" WARNING ! Make sure the DLL is 64/32-bit == the same as your neovim
" configuration. (i.e. a 64-bit compiled qgrep dll with a 32 bit version of
" vim is very bad)
"
" QGREP ON LINUX
" This qgrep files should be placed in 
"   ~/.vim/pack/plugins/start
" You should create a qgrep folder in there and put everything that is inside
" the qgrep vim/ directory.

if has("win32")
	set runtimepath^=~/vimfiles runtimepath+=~/vimfiles/after
else
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
endif
let &packpath = &runtimepath
filetype off
set nocompatible
if has("win32")
	set rtp+=C:\Users\hviala\vimfiles\bundle\Vundle.vim
	call vundle#begin('C:\Users\hviala\vimfiles\bundle')
else
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin('~/.vim/bundle')
endif
Plugin 'gmarik/Vundle.vim'

"Plugin 'bling/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'scrooloose/nerdtree'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'tikhomirov/vim-glsl'
Plugin 'morhetz/gruvbox'
Plugin 'vim-scripts/grep.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'ziglang/zig.vim'
if has("win32")
	Plugin 'nfvs/vim-perforce'
endif
Plugin 'tek256/simple-dark'

call vundle#end()
" enable filetype plugins
filetype plugin on
filetype indent on
" color highlight syntax
syntax enable

set background=dark
colorscheme gruvbox

" basic stuff
set encoding=utf-8

" about tabs
set tabstop=4
set softtabstop=4
" set expandtab
set shiftwidth=4
set smarttab
set autoindent

" show current line
set cursorline

" changing language to english because why not
set langmenu=en_US.UTF-8  
if has("win32")
	language messages en
else
	language messages en_GB.utf-8
endif
":language mes EN

" removing useless shit
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

let c_no_curly_error=1

if has("gui_running")
	"fullscreen at startup
	"au GUIEnter * simalt ~n 
	set lines=999 columns=999
endif

" displaying line numbers
set relativenumber
set nonumber
nnoremap <silent><C-a> :set relativenumber!<cr>:set number!<cr>

" quick close QuickFix window (for build)
nnoremap <C-x> :cclose<cr>


" dealing with azerty shit
nmap z w
nmap <C-T> <C-]>

set langmap=à@,è`,é~,ç_,’`,ù%
lmap à @
lmap è `
lmap é ~
lmap ç _
lmap ù %
lmap ’ `

" no more esc shit
inoremap jk <ESC>

" changing leader key to space
let mapleader=","

" setting a badass font
if has("nvim")
	" Font init is in ginit.vim
else
	"set guifont=Iosevka\ Term\ Regular\ 14
	"set guifont=LiberationMono\ 13
endif

" trying to do autocomplete on file search
set wildmode=longest,list,full
set wildmenu

" automatically reload modified files
set autoread

" search is now moar beautiful
set hlsearch
set incsearch

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

"highlight matching parenthesis, brackets, ...
set showmatch

" space now puts us at the center of the screen
nnoremap <Space> zz


" enable folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" no more beeps
set noerrorbells visualbell t_vb=
if has('autocmd')
	augroup personal_group
		autocmd!
		autocmd GUIEnter * set visualbell t_vb=
	augroup END
endif

" no backup
set nobackup
set nowb
set noswapfile

set switchbuf=useopen,split

""""""""""""""""""""""""""""""""""""""""""""""
"          CamelCaseMotion                   "
""""""""""""""""""""""""""""""""""""""""""""""

call camelcasemotion#CreateMotionMappings('<leader>')
map <silent> <leader>e <Plug>CamelCaseMotion_e
map <silent> <leader>v <Plug>CamelCaseMotion_b
map <silent> <leader>w <Plug>CamelCaseMotion_w
map <silent> <leader>z <Plug>CamelCaseMotion_w

"""""""""""""""""""""""""""""""""""""""""""""
"         BUILD BATCH                       "
"""""""""""""""""""""""""""""""""""""""""""""
let g:asyncrun_open = 3
function! s:build()
	if(has("win32"))
		compiler msvc
		:AsyncRun build.bat
	else
		compiler gcc
		:AsyncRun bash build.sh
	endif
endfunction

command! Build call s:build()
map <leader>b :Build<cr>

" Specific ubi stuff
if(has("win32"))
	" Perforce
	nmap <leader>p :set noshellslash<CR> :P4edit<CR> :set shellslash<CR>


	" Build scripts
	function! s:BuildScimitarTool_()
		compiler msbuild
		:AsyncRun c:/scripts/build_scimitar_tool.bat
	endfunction

	command! BuildScimitarTool call s:BuildScimitarTool_()
	nmap <leader>bt :BuildScimitarTool<cr>

	function! s:BuildScimitarEngine_()
		compiler msbuild
		:AsyncRun c:/scripts/build_scimitar_engine.bat
	endfunction

	command! BuildScimitarEngine call s:BuildScimitarEngine_()
	nmap <leader>be :BuildScimitarEngine<cr> 

	function! s:GenerateProjects_()
		:AsyncRun c:/scripts/generate_projects.bat
	endfunction

	command! GenerateProjects call s:GenerateProjects_()
	nmap <leader>gp :GenerateProjects<cr>

	set errorformat-=completed%s
endif

" Convert slashes to backslashes for Windows.
if has('win32')
  nmap ,cs :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap ,cl :let @*=substitute(expand("%:p"), "\\", "/", "g")<CR>
  nmap ,cm :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

  " This will copy the path in 8.3 short format, for DOS and Windows 9x
  nmap ,c8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap ,cs :let @*=expand("%")<CR>
  nmap ,cl :let @*=expand("%:p")<CR>
endif


if has("win32")
	set shellslash
endif

"set path+=**
"I do this because otherwise, on linux at least, the whole /usr/include folder
"is put inside the path. So the recursive ** makes _every_ :e look into this
"huge folder. I don't think this is a big deal removing this folder from path.
set path=.,**

set wildignore+=**/build/**
set wildignore+=**/bin/**
set wildignore+=**/zig-cache/**
set wildignore+=**/data/**
set wildignore+=**/tmp/**
set wildignore+=**/temp/**
set wildignore+=**/doc/**
set wildignore+=**/projects/**

nnoremap <leader>n :ls<CR>:b<SPACE>

set magic
set hidden

" remap esc to exit terminal command in vim
tnoremap <Esc> <C-\><C-n>

command! QgrepSearchCursor normal! viw"ay:QgrepSearch<cr><c-r>a
command! QgrepGetDefinition normal! viw"ay:QgrepSearch<cr>(class|struct|enum|typedef|define)(\s|\w)*\b<c-r>a\b($|[^;])
