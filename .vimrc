
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	GENERAL SETTINGS														 "
"																			 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" only uses file for vim, not vi. This removes any clashes
	set nocompatible

" allow backspacing over everything in insert mode
	set backspace=indent,eol,start

" enable file type detection for plugins
	filetype plugin indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
	let mapleader = ","
	let g:mapleader = ","
	
" number of lines in history memory
	set history=700

" :W sudo saves the file 
" (useful for handling the permission-denied error)
	 command W w !sudo tee % > /dev/null

" when a vim file is edited externally, an open version changes with the edit
" possibly only works while you have not edited your copy
	 set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	VIM USER INTERFACE														 "
"																			 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use UTF-8
	set encoding=utf-8

" turns on highlighting and colourising of programming code
	syntax on

" reduces tab indenting to 4 spaces, as per the python standard
	set shiftwidth=4
	set tabstop=4

" sets text file 'textwidth' to 78 characters
	autocmd FileType text setlocal textwidth=78

" makes it automatically indent in specific cases, such as 
" when adding a curly bracket ({)
	set smartindent

" Minimal number of screen lines to keep above and below the cursor.
	set scrolloff=10

" In many terminal emulators the mouse works just fine, thus enable it.
"	if has('mouse')
"		  set mouse=a
"	  endif

" binds Alt + Shift + G to show line numbers 
	map <A-G> :set nu!<CR>

" binds space to open and close folds
	map <space> za
	

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	ABBREVIATIONS															 "
"																			 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev myCopyright #Copyright (C) 2015 crayonsmelting - protected under Australian and International Copyright law <CR>#crayonsmelting can be found at http://www.github.com/crayonsmelting/ or at crayons.melting@gmail.com <CR>#Licence found within licence.txt <CR>############################################<CR><CR><CR><CR>

iabbrev shortCopy COPYRIGHT (C) 2015 crayonsmelting. See licence.txt.


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


	""EXPERIMENTAL - RESEARCH LATER""
	
" Autocomplete menus some sort of command
	" set wildmenu
	" wildmode=list:longest,full

