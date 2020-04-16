" BY HUGO VIALA.
"
" This is the init file for the gui part.
" This is for Neovim ONLY. The init.vim part should, in theory, work fine with
" only vim.
"
" ON WINDOWS
" THIS file should be located in C:\Users\my_user\AppData\Local\nvim\ginit.vim
" 
" ON LINUX :
" All plugins should be located in ~/.vim
" THIS file should be located in ~/.config/nvim/ginit.vim

if has("win32")
	GuiFont! Liberation Mono:h13
	GuiTabline 0
else
	GuiFont! Liberation Mono:h11
	GuiTabline 0
endif
