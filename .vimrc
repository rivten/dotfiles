" Vim plugins setup
filetype off
set nocompatible
set rtp+=~\vimfiles\bundle\Vundle.vim
call vundle#begin('~\vimfiles\bundle')
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'crtlpvim/ctrlp.vim'
Plugin 'elzr/vim-json'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tikhomirov/vim-glsl'
Plugin 'tpope/vim-dispatch'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-sensible'
Plugin 'junegunn/vim-easy-align'
Plugin 'vim-scripts/grep.vim'
Plugin 'jansedivy/jai.vim'
Plugin 'a-watson/vim-gdscript'
Plugin 'bkad/CamelCaseMotion'
Plugin 'vim-scripts/argtextobj.vim'

call vundle#end()
" enable filetype plugins
filetype plugin on
filetype indent on
" color highlight syntax
syntax enable

let UsingBasic = 0
if(UsingBasic == 0)
	set background=dark
	colorscheme gruvbox
else
	set background=light
	colorscheme basic
endif

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
:language mes EN

" removing useless shit
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

"extra C++ shit
syn keyword cppType local_persist internal_var internal_function global_var constant_var r32 r64 ubyte uint ulong i8 u8 i32 u32 i64 u64 i16 u16 b32

"fullscreen at startup
au GUIEnter * simalt ~n 

" displaying line numbers
set relativenumber
"set number

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
    set nonumber
  endif
endfunc

nnoremap <silent><C-a> :call NumberToggle()<cr>

" unmapping those arrow keys bitches
noremap <Up> <NOP>
noremap! <Up> <Esc>
noremap  <Down> <NOP>
noremap! <Down> <Esc>
noremap  <Left> <NOP>
noremap! <Left> <Esc>
noremap  <Right> <NOP>
noremap! <Right> <Esc>

" quick close QuickFix window (for build)
nnoremap <Leader>k :cclose<cr>


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

" make last typed word uppercase
inoremap <c-c> <ESC>viwUea

" changing leader key to space
let mapleader=","

" setting a badass font
set guifont=Iosevka:h14

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
  autocmd GUIEnter * set visualbell t_vb=
endif

" no backup
set nobackup
set nowb
set noswapfile

set switchbuf=useopen,split

if(UsingBasic == 0)
	augroup custom_highlight
		autocmd!
		autocmd VimEnter,WinEnter * match GruvboxGreenBold /NOTE/ | 2match ErrorMsg /TODO/
	augroup END
endif

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
function! s:build()
    let &makeprg='build.bat'
    silent make
    botright copen
    wincmd t
    wincmd H
endfunction

command! Build call s:build()
map <Leader>b :Build<cr>

"""""""""""""""""""""""""""""""""""""""""""""
"         PYTHON MODE                       "
"""""""""""""""""""""""""""""""""""""""""""""
" turn off Rope
let g:pymode_rope = 0

" no autofolding
let g:pymode_folding = 0

" no colorcolumn
let g:pymode_options_colorcolumn = 0

" ignoring the proper error
let g:pymode_lint_ignore = "E302,E303,C901,E501,E231,E251"

""""""""""""""""""""""""""""""""""""""""""""""
"        CtrlP                               "
""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath^=~/vimfiles/bundle/ctrlp.vim

" next CtrlP commands founds at
" http://dougblack.io/words/a-good-vimrc.html
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|sln|pdf|opensdf|pdb|obj|sdf|png|svg|vcxproj|filters|user|ilk|lib|exp|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'

"""""""""""""""""""""""""""""""""""""""""""""""
"        vim-airline                          "
"""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set ttimeoutlen=50
let g:airline_theme = 'powerlineish'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

""""""""""""""""""""""""""""""""""""""""""""""
"            NERDTree                        "
""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '\~$', '\.class$', '\.obj$', '\.exe$', '\.sln$', '.\vcxproj$', '\.filters$', '\.user$']
nmap <leader>ne : NERDTree<cr>


""""""""""""""""""""""""""""""""""""""""""""""
"            Vim-Align                       "
""""""""""""""""""""""""""""""""""""""""""""""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""
"          Opening commands                  "
"     this always needs to be at the end     "
""""""""""""""""""""""""""""""""""""""""""""""
if(UsingBasic == 0)
	" highlighting certain keywords
	windo match GruvboxGreenBold /NOTE/ | 2match ErrorMsg /TODO/
endif

""""""""""""""""""""""""""""""""""""""""""""""
"          GREP VIM                          "
""""""""""""""""""""""""""""""""""""""""""""""

let Grep_Path = 'c:/GnuWin32/bin/grep.exe'
let Fgrep_Path = 'c:/GnuWin32/bin/fgrep.exe'
let Egrep_Path = 'c:/GnuWin32/bin/egrep.exe'
let Grep_Find_Path = 'c:/GnuWin32/bin/find.exe'
let Grep_Xargs_Path = 'c:/GnuWin32/bin/xargs.exe'
let Grep_Default_Options = '-rI'
nmap <leader>g :Grep<cr>

