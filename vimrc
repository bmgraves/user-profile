"Features"
"Set 'nocompatible' to ward off unexpected things that your distro might have
"made as well as sanely reset options when re-sourcing .vimrc
set nocompatible
"" ------------------------------------
"" Plugins
"" ------------------------------------
"" Starting with plugins. Originally had them near the end but it broke a few things.
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'morhetz/gruvbox'
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }	
endif
call plug#end()
"" ------------------------------------
"" End Plugins
"" ------------------------------------

let g:deoplete#enable_at_startup = 1



"--------------------------------------------
" COLOR SCHEME:
"--------------------------------------------
" first set background to dark. Light themed is a blight upon the world.
set background=dark
colo gruvbox
"--------------------------------------------

"--------------------------------------------
"Custom Color disabled. Playing with gruvbox
" Set Color Scheme to my custom color scheme:
" colo ms-color
"--------------------------------------------



"--------------------------------------------
"Enable Syntax highlighting
syntax on
filetype off
filetype indent plugin on

" tab configs
"" set tabstop=2
"" set shiftwidth=2
"" set expandtab

" Automatic View saving for handling folding on files.
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview 


" ---------------------------------------------------------------------------------
"Must have options
" One such option is the 'hidden' option, which allows you to re-use the same
" " window and switch from an unsaved buffer without saving it first. Also
" allows
" " you to keep an undo history for multiple files when re-using the same
" window
" " in this way. Note that using persistent undo also lets you undo in
" multiple
" " files even in the same window, but is less efficient and is actually
" designed
" " for keeping undo history after closing Vim entirely. Vim will complain if
" you
" " try to quit without saving, and swap files will keep you safe if your
" computer
" " crashes.
"
set hidden

"Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (Use C-L to temporarily turn off highlighting 
set hlsearch

" Use case insensitiver search, except when using capital letters

set ignorecase
set smartcase

"Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

"When opening a new line and no filetype specific indenting is enabled, keep
"the same indent as the line you're currently on.
set autoindent

"Stop certain movements from always going to the first character of a line.
"while this behavior deviates from that of vi, it does what most users comming
"from other editors would expect.
set nostartofline


" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

"Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" " is unset, this does nothing.
set t_vb=

" Enable use of mouse for all modes
" set mouse=a


" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to cointinue"
set cmdheight=2

" Display line numbers on the left. Enable both number and relativenumber to allow for hybrid line numbers.
" IE: Line numbers will be relative, but the line you are on shows absolute linenumber.
set number
set relativenumber


" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200


" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
"------------------------------------------------------------


"----------------------------------------
"" Mappings 
"----------------------------------------
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" " next search
nnoremap <C-L> :nohl<CR><C-L>
" Open NERDTree
map <C-n> :NERDTreeToggle<CR>

"----------------------------------------
" Templates:
" This section allows you to add files to the .vim/templates directory.
" Vim will read these files when creating new files of a file extension and insert text from the
" Skeleton file into the new file.
"---------------------------------------
augroup templates
  au!
  " Check Directory for template files
  autocmd BufNewFile *.* silent! execute '0r ~/.vim/templates/skeleton.'.expand("<afile>:e")

  " Create dynamic Content
  autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END
"---------------------------------------
