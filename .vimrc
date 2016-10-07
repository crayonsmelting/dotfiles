" TODO: if vim has arguments (like a file), don't run sessionfile

	"  GUI SETTINGS  "
	""""""""""""""""""

if has ('gui_running')

" Boot up the current saved session
	try
		source ~/.session.vim
	catch E484
		" File does not exist error
	endtry

" set font to Anonymous Pro, font size to 12
	try
		set guifont=Anonymous\ Pro\ For\ Powerline\ 11
	catch E518
		"Sometimes it doesn't accept 12 as an option
		"Should be fixed now, I'm a big old dummy, but still:
		set guifont=Anonymous\ Pro\ For\ Powerline 
	endtry

endif

" For when vim is embedded in eclipse using eclim:
if exists('g:vimplugin_running')

	set guioptions-=m " turn off menu bar
	set guioptions-=T " turn off toolbar

endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	GENERAL SETTINGS														 "
"																			 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" If running on Windows, use .vim directory instead of 'vimfiles'
	let s:MSWindows = has('win95') + has('win16') + has('win32') + has('win64')
	if s:MSWindows
		set runtimepath=$VIM/.vim,$VIMRUNTIME,$VIM/vimfiles/after,$VIM/.vim/after
	endif

" only uses file for vim, not vi. This removes any clashes
	set nocompatible

" allow backspacing over everything in insert mode
	set backspace=indent,eol,start

" enable file type detection for plugins
	filetype plugin indent on

" number of lines in history memory
	set history=10000

" :W sudo saves the file
"  (useful for handling the permission-denied error)
	command W w !sudo tee % > /dev/null

" when a vim file is edited externally, an open version changes with the edit
"  possibly only works while you have not edited your copy
	set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	VIM USER INTERFACE														 "
"																			 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" colorscheme to desert
	colorscheme desert

" show relative numbering
	set relativenumber
	set numberwidth=2

" Use UTF-8
	set encoding=utf-8

" turns on highlighting and colourising of programming code
	syntax on

" reduces tab indenting to 4 spaces, as per the python standard
" note that tabs are still tabs, not spaces
	set shiftwidth=4
	set tabstop=4

" text files may not extend further than 78 characters horizonally
	autocmd FileType text setlocal textwidth=78
	autocmd FileType markdown setlocal textwidth=78
	autocmd FileType python setlocal textwidth=80

" makes it automatically indent in specific cases, such as
"  when adding a curly bracket ({)
	set smartindent

" Minimal number of screen lines to keep above and below the cursor.
	set scrolloff=7

" In many terminal emulators the mouse works just fine, thus enable it.
	if has('mouse')
		set mouse=a
		endif

" Disable beeping
	set noeb vb t_vb=
	au GUIEnter * set vb t_vb=

" Spell checker for Australian English, but not in helpfiles
	autocmd FileType text setlocal spell spelllang=en_au
	autocmd FileType help au! FileType text
	autocmd Syntax  help setlocal spell!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	ABBREVIATIONS AND MAPPINGS												 "
"																			 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

iabbrev myCopyrightHash 
		\#Copyright (C) 2015 Michael Ruigrok - protected under Australian and International Copyright law
	\<CR>#Michael Ruigrok can be found at http://www.github.com/michaelruigrok/
	\<CR>#or at ruigrok.michael@gmail.com 
	\<CR>#Licence found within licence.txt 
	\<CR>############################################ 
	\<CR> 
	\<CR> 
	\<CR> 
	\<CR> 

iabbrev myCopyrightSlash 
		\/* Copyright (C) 2015 Michael Ruigrok - protected under Australian and International Copyright law
	\<CR>Michael Ruigrok can be found at http://www.github.com/michaelruigrok/
	\<CR>or at michael.ruigrok@gmail.com 
	\<CR>Licence found within licence.txt 
	\<CR>*/ 
	\<CR> 

iabbrev shortCopy COPYRIGHT (C) 2015 Michael Ruigrok. See licence.txt.

iabbrev addBreak 
	\<CR>-------------------------------------------------------------------
	\-------------
	\<CR>  


	" HTML SHORTCUTS "
	""""""""""""""""""

iabbrev htmlTemplate <!DOCTYPE html>
	\<CR>
	\<CR><html lang="en">
	\<CR><head>
	\<CR><meta charset="utf-8"/>
	\<CR><title></title>
	\<CR></head>
	\<CR><body>
	\<CR></body>
	\<CR></html>

iabbrev cssLink <link rel='stylesheet' type='text/css' href='css/style.css'/>

iabbrev jsLink <script type="text/javascript" src="js/main.js"></script>

iabbrev jqueryLink <script type="text/javascript" src="js/jquery.js"></script>

" This is supposed to add a closing tag to an element automatically, after you
" type in "<//"
	inoremap <lt>// </<C-X><C-O>


	" C abreiviations "
iabbrev cTemp #include <stdio.h>
	\<CR>#include <stdbool.h>
	\<CR>#include <stdlib.h>
	\<CR>
	\<CR>int main(int argc, char** argv) {
	\<CR>
	\<CR>return 0;
	\<CR>}

iabbrev cFileOpen #include <sys/types.h>
	\<CR>#include <sys/stat.h>
	\<CR>#include <fcntl.h>

iabbrev cThreads #include <pthread.h>
	\<CR>#include <semaphore.h>

	" LEADER "
	""""""""""

" With a map leader it's possible to do extra key combinations
"  like <leader>w saves the current file
	let mapleader = ","
	let g:mapleader = ","

" leader-p runs the the previous colon command 
 	nnoremap <leader>p @:

" leader-n toggles between relative and absolute numbering
	nnoremap <leader>n :call NumberToggle()<cr>
	
	" required function
		function! NumberToggle()
			if(&relativenumber == 1)
				set relativenumber!
				set number 
			else
				set relativenumber
				set number!
			endif
		endfunc

" leader-b is the black hole register (deleting or changing without saving for
"  pasting)
	nnoremap <leader>b "_

" I wonder what control-S should do?
	noremap <c-s> <Esc>:w<CR>

" leader-s saves the session, leader-S saves session and buffers
	noremap <leader>s :mks! ~/.session.vim<CR>
	noremap <leader>S :mks! ~/.session.vim<CR>:w<CR>

" leader-L saves the session, leader-S saves session and buffers
" note the capital, different from leading into language specific binds
	noremap <leader>L :source ~/.session.vim<CR>

" :C or leader-c clears search and colour column
	command C let @/ = ""
	nnoremap <leader>c :let @/ = ""<CR>:set cc=0<CR>

" Rather than deleting _all_ my stuff, Ctrl-w Ctrl-w changes window (like in
" normal mode)
	imap <C-w><C-w> <esc><C-w><C-w>

" binds Alt + Shift + G to show/hide line numbers
	map <leader>g :set nu!<CR>

" binds space to open and close folds
	map <space> za

" with vim-surround, leader comments out the surrounded word
	try
		unmap <leader>C
	" catch the 'No Such Mapping' Error
	catch E3
		" Do nothing
	endtry
	autocmd FileType javascript map <buffer> <leader>Cw ysiW*ysiW/

" returns you to normal mode when you press 'j'  and 'k' at the same time
	inoremap jk <Esc>
	inoremap kj <Esc>

" MakeTags will make your ctags
command MakeTags !ctags -R .

" for python, <leader>m runs code in python
	autocmd FileType python nnoremap <buffer> <leader>m :!python %<CR>
	
" for bash, <leader>m runs code in bash
	autocmd FileType sh nnoremap <buffer> <leader>m :!%<CR>

" for this vimrc, <leader>m reloads its contents
	autocmd FileType vim nnoremap <buffer> <leader>m :so %<CR>

" for c/c++, <leader>m compiles a single file and then runs the binary
	function CompileC(...)
	    let newfile = split(expand('%:p'),"\\.")[0]
	    let argc = 1
	    let argv = ''
	    for arg in a:000
		let argv = argv . ' ' . arg
		argc += 1
	    endfor
	    if filereadable(expand('%:p:h') . '/Makefile')
		make
	    else
		execute '!clear; gcc -std=c99 -pedantic -Wall ' . expand('%:p') . ' -o ' . newfile . ' && ' newfile . ' ' . argv
	    endif
	endfunction

	autocmd FileType c nnoremap <buffer> <leader>m :call CompileC()<CR>
	autocmd FileType cpp nnoremap <buffer> <leader>m :call CompileC()<CR>
	autocmd FileType c++ nnoremap <buffer> <leader>m :call CompileC()<CR>

" for , <leader>m compiles the file and then runs the binary
	function CompileJava()
		let cdir = getcwd()
		let jdir = expand('%:p:h')
		execute 'silent cd ' . jdir
		execute 'silent cd ..'
		let jfile = split(expand('%'),"\\.")[0]
		execute '!clear; javac ' . expand('%') . ' && java ' . jfile
		execute 'cd ' . cdir
	endfunction

	autocmd FileType java nnoremap <buffer> <leader>m :call CompileJava()<CR>


	" LANGUAGE SPECIFIC COMMANDS"
	"""""""""""""""""""""""""""""
	
" Leader-l ($L for short) is a leader for language-specific commands:

	" Eclim "
		if exists('g:vimplugin_running')

			" $L-b toggles java debugger breakpoint
			nnoremap <leader>lb :JavaDebugBreakpointToggle!<cr>


		" leader-l-d prefix for other debugger commands:
			
			" $L-d-l lists all breakpoints of current file
			nnoremap <leader>ldl :JavaDebugBreakpointsList<cr>

			" $L-d-L lists all breakpoints, including dependent files
			nnoremap <leader>ldL :JavaDebugBreakpointsList!<cr>

			" $L-d-r lists all breakpoints, including dependent files
			nnoremap <leader>ldr :JavaDebugBreakpointRemove<cr>
			
			" $L-d-R lists all breakpoints, including dependent files
			nnoremap <leader>ldR :JavaDebugBreakpointRemove<cr>

		endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	SEARCHING																 "
"																			 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Starts searching while you type in your search
    set incsearch

" Highlights all search instances
	set hlsearch

" Searches using all lowercase include capitals, but not the other way around
	set ignorecase
	set smartcase


" Autocomplete menus some sort of command
	"set wildmode=longest:full
	set wildmode=list:full
	set wildmenu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	HISTORY & UNDO															 "
"																			 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tell it to use an undo file
	set undofile
" set a directory to store the undo history
	set undodir=~/.vim/undo-history/

	"Pathogen"
	""""""""""
	execute pathogen#infect()


	"Airline"
	"""""""""

	if exists(':AirlineRefresh')

" fix such that airline runs without having to split
	set laststatus=2
	
" turn on pretty arrows
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#whitespace#checks = [ 'indent', 'long' ]

	endif


