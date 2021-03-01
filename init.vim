" BY HUGO VIALA.
"
" This is my vimrc file.
" There are three plugins that might need direct install :
" - vundlevim/vundle
" - zeux/qgrep
" - tek256/simple-dark
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
let &packpath=&runtimepath
filetype off
set nocompatible
if has("win32")
	set runtimepath+=C:\Users\hviala\vimfiles\bundle\Vundle.vim
	call vundle#begin('C:\Users\hviala\vimfiles\bundle')
else
	set runtimepath+=~/.vim/bundle/Vundle.vim
	call vundle#begin('~/.vim/bundle')
endif
Plugin 'gmarik/Vundle.vim'

Plugin 'tikhomirov/vim-glsl'
Plugin 'morhetz/gruvbox'
Plugin 'bkad/CamelCaseMotion'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'ziglang/zig.vim'
if has("win32")
	Plugin 'nfvs/vim-perforce'
endif
Plugin 'tek256/simple-dark'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'habamax/vim-godot'
Plugin 'srcery-colors/srcery-vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'pangloss/vim-javascript'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'vhdirk/vim-cmake'
Plugin 'dpelle/vim-Grammalecte'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'leafgarland/typescript-vim'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'dstein64/vim-startuptime'
Plugin 'kassio/neoterm'

call vundle#end()
" enable filetype plugins
filetype plugin on
filetype indent on
" color highlight syntax
syntax enable

set title

set background=dark
"colorscheme gruvbox
colorscheme srcery
let g:srcery_underline=0

" basic stuff
set encoding=utf-8

" about tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
set lazyredraw

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

" removing useless stuff
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
nnoremap <silent><F12> :set relativenumber!<cr>:set number!<cr>

" dealing with azerty stuff
nnoremap <C-T> <C-]>
nnoremap <C-]> <C-T>
nnoremap g<C-T> g<C-]>

set langmap=à@,è`,é~,ç^,’`,ù%
lmap à @
lmap è `
lmap é ~
lmap ç ^
lmap ù %
lmap ’ `

" no more esc
inoremap jk <ESC>

" changing leader key to comma
let mapleader=","
" because having my leader to comma, it is not possible to do f,
" so I remap it to f§ which is close on french keyboard
nnoremap § ,

" setting a badass font
if has("nvim")
	" Font init is in ginit.vim
else
	"set guifont=Iosevka\ Term\ Regular\ 14
	"set guifont=LiberationMono\ 13
endif

" trying to do autocomplete on file search
set wildmode=longest,list:full,full
set wildmenu

" automatically reload modified files
set autoread

" search is now moar beautiful
set hlsearch
set incsearch

" show the result of the modification in real time before applying it
set inccommand=nosplit

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

"highlight matching parenthesis, brackets, ...
set showmatch

" space now puts us at the center of the screen
nnoremap <Space> zz

" Backspace instead of CTRL-6 or CTRL-^ (not very close on azerty keyboard)
nnoremap <bs> <C-^>

" enable folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

function! LoadProjectSpecificVimScript()
    if filereadable('project.vim')
        " command internal to current project
        source project.vim
    endif
endfunction

" no more beeps
set noerrorbells visualbell t_vb=
if has('autocmd')
	augroup personal_group
		autocmd!
		autocmd GUIEnter * set visualbell t_vb=

        " Godot - for gdscript, do not set tab as spaces
        autocmd FileType gdscript3 setlocal noexpandtab

        autocmd!
        " NOTE(hugo): this works because VimEnter is called _AFTER_ loading
        " this file, so we will rightly override default setup.
        " TODO(hugo): how do we reset the setup when there is no project.vim
        " file ? Maybe setup a project_default.vim ? Because at least we
        " should remove the commands from the project.vim previously loaded...
        autocmd DirChanged,VimEnter * call LoadProjectSpecificVimScript()

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
let g:asyncrun_open = 8
" TODO(hugo): maybe delete this ?
if(has("win32"))
    compiler msvc
    "compiler msbuild
    map <leader>b :AsyncRun build.bat<cr>
else
    compiler gcc
    map <leader>b :AsyncRun bash build.sh<cr>
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

"I do this because otherwise, on linux at least, the whole /usr/include folder
"is put inside the path. So the recursive ** makes _every_ :e look into this
"huge folder. I don't think this is a big deal removing this folder from path.
set path=.,,
"set path=.,**

set magic
set hidden

" vertical split is on the right by default (instead of left)
set splitright

" even vim recommends this for consistency
noremap Y y$

" fzf
" What I do here is special. I don't want fzf in hugely big projects like I do
" at work. For those, I use qgrep which caches the results in order to get
" them very easily. For this first version, I will just list the folder that
" uses qgrep. If I launch vim in those folder, I won't override <C-P> and let
" qgrep have that mapping. Otherwise, I will override it with fzf.
" TODO(hugo): parse the .qgrep folder for the cfg files of each mapped
" project. Check if the path of those projects is the current working
" directory. This avoids having a hardcoded list of folder.
" TODO(hugo): actually put what is project-local to project.vim file
let is_qgrep_project = 0
if has("win32")
    let qgrep_projects = ['d:\JD_CODE_STREAM\hugo_jd_work']
else
    let qgrep_projects = ['/home/hugo/dev/handmadehero/cpp/code']
endif
if index(qgrep_projects, getcwd()) != -1
    "in theory, we should check if qgrep executable is here
    " but executable("qgrep") does not seem to work...
    let is_qgrep_project = 1
endif

let use_fzf = 0
if executable("fzf")
    let g:qgrep_map = 0 "tell qgrep not to map commands
    if has("win32")
        nnoremap <C-P> :FZF<CR>
    else
        nnoremap <C-P> :Files<CR>
    endif
    nnoremap <leader>n :Buffers<CR>
    if executable("ag")
        nnoremap <C-S> :Ag<CR>
    endif
else
    " no fzf configuration
    " remap esc to exit terminal command in vim
    if has("win32")
    else
        tnoremap <Esc> <C-\><C-n>
    endif
    nnoremap <leader>n :ls<CR>:b<SPACE>
endif

let $PYTHONUNBUFFERED=1

function! SwitchCPPHeader()
    " TODO(hugo): improve for C files.
    let l:current_buf_name = bufname()
    let l:next_buf_name = ""
    if l:current_buf_name[-4:-1] == '.cpp'
        let l:next_buf_name = l:current_buf_name[0:-5] . '.h'
    elseif l:current_buf_name[-2:-1] == '.h'
        let l:next_buf_name = l:current_buf_name[0:-3] . '.cpp'
    else
        echomsg "This is not a cpp/h file!"
        return
    endif
    if bufwinnr(l:next_buf_name) == -1
        execute("edit " . l:next_buf_name)
    else
        execute("buffer " . l:next_buf_name)
    endif
endfunction
nnoremap <silent><C-Z> :call SwitchCPPHeader()<CR>

if executable("ag")
    set grepprg=ag\ --vimgrep\ --smart-case
endif

" TODO(hugo): do I need this ?
" set wildignorecase
set fileignorecase

set termguicolors

" Exiting in the terminal
tnoremap jk <C-\><C-n>

let g:grammalecte_cli_py="/home/hugo/programs/Grammalecte-fr-v2.0.0/grammalecte-cli.py"
let g:grammalecte_disable_rules = 'apostrophe_typographique apostrophe_typographique_après_t espaces_début_ligne espaces_milieu_ligne espaces_fin_de_ligne typo_points_suspension1 typo_tiret_incise nbsp_avant_double_ponctuation nbsp_avant_deux_points nbsp_après_chevrons_ouvrants nbsp_avant_chevrons_fermants1 unit_nbsp_avant_unités1 unit_nbsp_avant_unités2 unit_nbsp_avant_unités3 typo_guillemets_typographiques_doubles_fermants typo_guillemets_typographiques_doubles_ouvrants'

" Srcery Haskell override
if get(g:, 'colors_name', '') == 'srcery'
    hi! link haskellType SrceryBrightBlue
    hi! link haskellIdentifier SrceryBrightWhite
    hi! link haskellSeparator SrceryBlue
    hi! link haskellDelimiter SrceryBrightWhite
    hi! link haskellOperators SrceryWhite

    hi! link haskellBacktick SrceryYellow
    hi! link haskellStatement SrceryYellow
    hi! link haskellConditional SrceryYellow

    hi! link haskellLet SrceryCyan
    hi! link haskellDefault SrceryCyan
    hi! link haskellWhere SrceryCyan
    hi! link haskellBottom SrceryCyan
    hi! link haskellBlockKeywords SrceryCyan
    hi! link haskellImportKeywords SrceryCyan
    hi! link haskellDeclKeyword SrceryCyan
    hi! link haskellDeriving SrceryCyan
    hi! link haskellAssocType SrceryCyan
    hi! link haskellDecl SrceryBrightMagenta

    hi! link haskellNumber SrceryMagenta
    hi! link haskellPragma SrceryMagenta

    hi! link haskellString SrceryBrightGreen
    hi! link haskellChar SrceryBrightGreen

    hi! link haskellKeyword SrceryBrightOrange
endif
