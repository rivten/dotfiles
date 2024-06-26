" BY HUGO VIALA.
"
" This is my vimrc file.
" There are three plugins that might need direct install :
" - vundlevim/vundle
" - zeux/qgrep
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

filetype off
set nocompatible

call plug#begin()
Plug 'tikhomirov/vim-glsl'
"Plug 'morhetz/gruvbox'
Plug 'bkad/CamelCaseMotion'
Plug 'junegunn/goyo.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'ziglang/zig.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'habamax/vim-godot'
Plug 'srcery-colors/srcery-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'dpelle/vim-Grammalecte'
Plug 'ludovicchabant/vim-gutentags'
Plug 'leafgarland/typescript-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'rust-lang/rust.vim'
"Plug 'kassio/neoterm'
Plug 'jsborjesson/vim-uppercase-sql'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/suda.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'reedes/vim-pencil'
Plug 'StanAngeloff/php.vim'
Plug 'udalov/kotlin-vim'
Plug 'mcchrish/nnn.vim'
Plug 'pgdouyon/vim-yin-yang'
Plug 'fatih/vim-go'
Plug 'embear/vim-localvimrc'
Plug 'akinsho/toggleterm.nvim'
Plug 'iosmanthus/vim-nasm'
"Plug 'evanleck/vim-svelte'
Plug 'mbbill/undotree'
Plug 'NoahTheDuke/vim-just'
Plug 'rluba/jai.vim'
Plug 'preservim/vim-colors-pencil'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Tetralux/odin.vim'
Plug 'zah/nim.vim'
"Plug 'mickael-menu/zk-nvim'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fireplace'
Plug 'bhurlow/vim-parinfer'
Plug 'ocaml/vim-ocaml'
Plug 'jpalardy/vim-slime'
Plug 'ElmCast/elm-vim'
Plug 'bfrg/vim-jq'
Plug 'wlangstroth/vim-racket'
Plug 'mlochbaum/BQN', {'rtp': 'editors/vim'}
Plug 'gagbo/vim-gnuplot'
Plug 'ledger/vim-ledger'
Plug 'Nicoloren/vim-french-thesaurus'
Plug 'vim-scripts/pgn.vim'
Plug 'cdelledonne/vim-cmake'
Plug 'glensc/vim-syntax-lighttpd'
Plug 'bellinitte/uxntal.vim'
Plug 'itchyny/lightline.vim'

"Some cool black&white colorscheme, just in case
"Plug 'pbrisbin/vim-colors-off'
"Plug 'huyvohcmc/atlas.vim'
"Plug 'andreasvc/vim-256noir'
"Plug 'ewilazarus/preto'

call plug#end()
" enable filetype plugins
filetype plugin on
filetype indent on
" color highlight syntax
syntax enable

set title

set noshowmode
let g:lightline = {'colorscheme': 'srcery_drk'}
set laststatus=2

"set background=dark
"colorscheme gruvbox
colorscheme srcery
let g:srcery_underline=0
"colorscheme yin
" to have no background in terminal
" highlight Normal guibg=None

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
	"language messages en_GB.utf-8
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

if !has("nvim")
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
endif

" displaying line numbers
set relativenumber
set nonumber
nnoremap <silent><F12> :set relativenumber!<cr>:set number!<cr>

" dealing with azerty stuff
nnoremap <C-T> <C-]>
nnoremap <C-]> <C-T>
nnoremap g<C-T> g<C-]>

"set langmap=à@,è`,é~,ç^,’`,ù%
"lmap à @
"lmap è `
"lmap é ~
"lmap ç ^
"lmap ù %
"lmap ’ `

let mapleader=","

" no more esc
inoremap <Tab> <ESC>
inoremap <S-Tab> <Tab>
vnoremap <Tab> <ESC>
inoremap þß <ESC> 

" changing leader key to comma
" because having my leader to comma, it is not possible to do f,
" so I remap it to f§ which is close on french keyboard
nnoremap € ;
nnoremap ’ ,

" setting a badass font
if !has("nvim")
    if has("gui_running")
        set guifont=LiberationMono\ 12
    endif
else
	" Font init is in ginit.vim
endif

" trying to do autocomplete on file search
set wildmode=longest,full
set wildmenu

" automatically reload modified files
set autoread

" search is now moar beautiful
set hlsearch
set incsearch

if has('nvim')
    " show the result of the modification in real time before applying it
    set inccommand=nosplit
endif

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

" no more beeps
set noerrorbells visualbell t_vb=
if has('autocmd')
	augroup personal_group
		autocmd!
		autocmd GUIEnter * set visualbell t_vb=

        " Godot - for gdscript, do not set tab as spaces
        autocmd FileType gdscript3 setlocal noexpandtab

        "autocmd BufWritePost *.vim source %
        "autocmd BufWritePost .lvimrc source %
        "autocmd BufWritePost .lvimrc.lua luafile %

        autocmd BufReadPost *.pgn set syntax=pgn
	augroup END

	"augroup autoformat_group
    "    autocmd BufWritePre *.py call PythonFormat()
    "    autocmd BufWritePre *.c,*.h,*.cpp call ClangFormat()
	"augroup END
endif

function! RunFormatter(executable, cmdline) abort
  " Save cursor position and many other things.
  let view = winsaveview()

  if !executable(a:executable)
    echohl Error | echomsg "no ". a:executable . " binary found in PATH" | echohl None
    return
  endif

  let cmdline = a:cmdline
  let current_buf = bufnr('')

  " The formatted code is output on stdout, the errors go on stderr.
  if exists('*systemlist')
    silent let out = systemlist(cmdline, current_buf)
  else
    silent let out = split(system(cmdline, current_buf))
  endif
  let err = v:shell_error


  if err == 0
    " remove undo point caused via BufWritePre.
    try | silent undojoin | catch | endtry

    " Replace the file content with the formatted version.
    if exists('*deletebufline')
      call deletebufline(current_buf, len(out), line('$'))
    else
      silent execute ':' . len(out) . ',' . line('$') . ' delete _'
    endif
    call setline(1, out)

    " No errors detected, close the loclist.
    call setloclist(0, [], 'r')
    lclose
  elseif get(g:, 'autopep8_parse_errors', 1)
    let errors = s:parse_errors(expand('%'), out)

    call setloclist(0, [], 'r', {
        \ 'title': 'Errors',
        \ 'items': errors,
        \ })

    let max_win_height = get(g:, 'zig_fmt_max_window_height', 5)
    " Prevent the loclist from becoming too long.
    let win_height = min([max_win_height, len(errors)])
    " Open the loclist, but only if there's at least one error to show.
    execute 'silent! lwindow ' . win_height
  endif

  call winrestview(view)

  if err != 0
    echohl Error | echomsg "autopep8 returned error" | echohl None
    return
  endif

  " Run the syntax highlighter on the updated content and recompute the folds if
  " needed.
  syntax sync fromstart
endfunction

function! PythonFormat() abort
    call RunFormatter('black', 'black -q -')
endfunction

function! ClangFormat() abort
    call RunFormatter('clang-format', 'clang-format --style=WebKit -')
endfunction

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
if has("nvim")
    nnoremap <leader>b :make<enter>
else
    nnoremap <leader>b :AsyncRun -program=make<enter>
endif

" Convert slashes to backslashes for Windows.
if has('win32')
  nmap ,cs :let @+=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap ,cl :let @+=substitute(expand("%:p"), "\\", "/", "g")<CR>
  nmap ,cm :let @+=substitute(expand("%:p"), "/", "\\", "g")<CR>

  " This will copy the path in 8.3 short format, for DOS and Windows 9x
  nmap ,c8 :let @+=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap ,cs :let @+=expand("%")<CR>
  nmap ,cl :let @+=expand("%:p")<CR>
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

let use_fzf = 0
if executable("fzf")
    let g:qgrep_map = 0 "tell qgrep not to map commands
    if has("win32")
        nnoremap <C-P> :FZF<CR>
    else
        nnoremap <C-P> :Files<CR>
    endif
    nnoremap <leader>n :Buffers<CR>

    " remap commands to avoid searching for filenames
    command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
    command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

    if executable("rg")
        nnoremap <C-S> :Rg<CR>
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

if executable("rg")
    set grepprg=rg\ --vimgrep\ --smart-case
endif

" TODO(hugo): do I need this ?
" set wildignorecase
set fileignorecase

if !has("nvim")
    set termguicolors
endif

let g:grammalecte_cli_py="/usr/bin/grammalecte-cli"
let g:grammalecte_disable_rules = 'apostrophe_typographique apostrophe_typographique_après_t espaces_début_ligne espaces_milieu_ligne espaces_fin_de_ligne typo_points_suspension1 typo_tiret_incise nbsp_avant_double_ponctuation nbsp_avant_deux_points nbsp_après_chevrons_ouvrants nbsp_avant_chevrons_fermants1 unit_nbsp_avant_unités1 unit_nbsp_avant_unités2 unit_nbsp_avant_unités3 typo_guillemets_typographiques_doubles_fermants typo_guillemets_typographiques_doubles_ouvrants typo_tiret_incise2 esp_fin_ligne typo_tiret_début_ligne typo_guillemets_perdus'

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

    "hi! link VimwikiHeader1 SrceryRed
    "hi! link VimwikiHeader2 SrceryBrightOrange
    "hi! link VimwikiHeader3 SrceryBrightBlue
    "hi! link VimwikiLink SrceryBrightGreen
    "hi! link VimwikiList SrceryBrightWhite
    "hi! link VimwikiCode SrceryBrightBlue

    hi! link ocamlKeyChar SrceryWhite
    hi! link ocamlKeyword SrceryBrightOrange
    hi! link ocamlArrow SrceryWhite
    hi! link ocamlModPreRHS SrceryWhite
    hi! link ocamlAnyVar SrceryWhite
    hi! link ocamlConstructor SrceryBrightMagenta

    hi! link tomlTable SrceryBrightBlue
    hi! link tomlTableArray SrceryBrightBlue
endif

function! ResetColorscheme()
    set bg=dark
    colorscheme srcery
    hi! link Title SrceryBrightBlueBold
    syntax enable
endfunction

" prose setup
" adapted from https://www.reddit.com/r/vim/comments/q03mqa/my_setup_for_prose/
let w:ProseModeOn = 0

function! EnableProseMode()
    "setlocal spell spelllang=fr
    "colorscheme pencil
    Goyo 70
    SoftPencil
endfu

function! DisableProseMode()
    Goyo!
    if &filetype ==# 'markdown'
        NoPencil
    endif
    "setlocal nospell
endfu

function! ToggleProseMode()
    if w:ProseModeOn == 0
        call EnableProseMode()
        let w:ProseModeOn = 1
    else
        call DisableProseMode()
    endif
endfu

augroup writing
    autocmd!
    autocmd! User GoyoLeave nested call ResetColorscheme()
augroup END

command! Prose call EnableProseMode()
command! UnProse call DisableProseMode()
command! ToggleProse call ToggleProseMode()

let g:rustfmt_autosave = 1
let g:cargo_makeprg_params = 'build'

let g:nnn#set_default_mappings = 0
"nnoremap <leader><Space> :NnnPicker<CR>
nnoremap <leader>f :NnnExplorer<CR>

let g:gutentags_project_root = ['.gutctags']

let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0

"lua require("toggleterm").setup{direction = 'float'}

"nnoremap þß :ToggleTerm<CR>
"tnoremap þß <C-\><C-n>:ToggleTerm<CR>

if !has("nvim")
    execute "set <M-t>=\et"
    execute "set <M-r>=\er"
    execute "set <M-s>=\es"
    execute "set <M-c>=\ec"
endif

nnoremap <M-t> <C-w>j
nnoremap <M-r> <C-w>l
nnoremap <M-s> <C-w>k
nnoremap <M-c> <C-w>h

nnoremap <C-w>T <C-w>J
nnoremap <C-w>R <C-w>L
nnoremap <C-w>S <C-w>K
nnoremap <C-w>C <C-w>H

tnoremap <M-t> <C-\><C-n><C-w>j
tnoremap <M-r> <C-\><C-n><C-w>l
tnoremap <M-s> <C-\><C-n><C-w>k
tnoremap <M-c> <C-\><C-n><C-w>h

nnoremap <C-Q> :Tags<CR>

let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '40%' }

" taken from vim-bepo but largely adapted

"s:tomap is for text-objects
function! s:tomap(key, target) abort
  if maparg(a:key, 'o') ==# ''
    execute "onoremap" a:key a:target
  endif
  if maparg(a:key, 'x') ==# ''
    execute "xnoremap" a:key a:target
  endif
endfunction

"s:amap is for the rest
function! s:amap(key, target) abort
  if maparg(a:key, 'n') ==# ''
    execute "nnoremap" a:key a:target
  endif
  if maparg(a:key, 'v') ==# ''
    execute "vnoremap" a:key a:target
  endif
  call s:tomap(a:key, a:target)
endfunction

call s:amap(   'c',  'h'     )    "on préserve {hjkl} pour les directions
call s:amap(   't',  'j'     )    "on préserve {hjkl} pour les directions
call s:amap(   's',  'k'     )    "on préserve {hjkl} pour les directions
call s:amap(   'r',  'l'     )    "on préserve {hjkl} pour les directions
call s:amap(   'C',  'H'     )    "{HJKL} devient [CTSR]
call s:amap(   'T',  'J'     )    "{HJKL} devient [CTSR]
call s:amap(   'S',  'K'     )    "{HJKL} devient [CTSR]
call s:amap(   'R',  'L'     )    "{HJKL} devient [CTSR]
call s:amap(  'gt', 'gj'     )    "on préserve les variantes avec 'g'
call s:amap(  'gs', 'gk'     )    "on préserve les variantes avec 'g'
call s:amap(  'zt', 'zj'     )    "on préserve les variantes avec 'z'
call s:amap(  'zs', 'zk'     )    "on préserve les variantes avec 'z'
call s:amap(   'h',  'c'     )    "{t} devient [h] pour être proche de [f]
call s:amap(   'H',  'C'     )    "idem pour {T} et [H]
call s:amap(   'l',  'r'     )    "{c} devient [l]
call s:amap(   'L',  'R'     )    "{C} devient [L]
call s:amap(   'j',  't'     )    "{j} devient [r]
call s:amap(   'J',  'T'     )    "{J} devient [R]
call s:amap(   'k',  's'     )    "{k} devient [s]
call s:amap(   'K',  'S'     )    "{h} devient [S]
call s:amap(   'gb', 'gT'    )    "le couple [gb]/[gé] agit sur les tabs
call s:amap(   'gé', 'gt'    )    "le couple [gb]/[gé] agit sur les tabs
call s:amap(   'gB', ':execute "silent! tabfirst"<CR>'   )    "[gB] va au premier tab
call s:amap(   'gÉ', ':execute "silent! tablast"<CR> '   )    "[gÉ] au dernier
call s:amap(   'gT', '<C-]>' )    "[gT] est libéré et peut agir sur les tags
call s:amap(   '«',  '<'     )    "[<] est moins accessible que [«]
call s:amap(   '»',  '>'     )    "idem pour [»] et [>]
call s:amap(   ';',  ','     )    "idem pour [,] et [;]
call s:amap(   ',',  ';'     )    "qui sont permutés
call s:amap(  'g,',  'g;'    )    "idem pour [g,] et [g;]
call s:amap(  'g;',  'g,'    )    "qui sont permutés
call s:amap(   'é',  'w'     )    "[w] est peu accessible, on utilise [é]
call s:amap(   'É',  'W'     )    "idem pour [W] et [É]
call s:tomap( 'aé',  'aw'    )    "idem pour [aw] et [aé]
call s:tomap( 'aÉ',  'aW'    )    "idem pour [aW] et [aÉ]
call s:tomap( 'ié',  'iw'    )    "idem pour [iw] et [ié]
call s:tomap( 'iÉ',  'iW'    )    "idem pour [iW] et [iÉ]

" remap for tpope's plugins
let g:nremap = {'t': 'j', 'c': 'h', 's': 'k', 'r': 'l'}
let g:xremap = {'t': 'j', 'c': 'h', 's': 'k', 'r': 'l'}
let g:oremap = {'t': 'j', 'c': 'h', 's': 'k', 'r': 'l'}

execute "inoremap \u00A0 <Space>"

set spelllang=en,fr
set spellcapcheck=""
inoremap <C-l> <C-g>u<Esc>[s1z=`]a<C-g>u

let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-t>"
let g:UltiSnipsJumpBackwardTrigger="<c-s>"

hi! link Title SrceryBrightBlueBold

"let g:localvimrc_name = [".lvimrc", ".lvimrc.lua"]
let g:localvimrc_name = [".lvimrc"]

"lua require("zk").setup({picker="fzf", lsp=nil})

let g:slime_target = "x11"

"luafile ~/.config/nvim/init_lua.lua

let g:bqn_prefix_key = 'à'

set thesaurus+=~/.local/share/nvim/plugged/vim-french-thesaurus/francais_vim.txt

set foldmethod=marker

command! Scratch new | setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile number

au FileType netrw nmap <buffer> t <down>
au FileType netrw nmap <buffer> s <up>
au FileType netrw nmap <buffer> c -
au FileType netrw nmap <buffer> r <CR>

nnoremap <leader><Space> :AsyncRun 
