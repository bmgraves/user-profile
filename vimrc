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
	" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }	
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
call plug#end()
"" ------------------------------------
"" End Plugins
"" ------------------------------------


"" Coc Configurations
if exists(':CocInstall')
	let g:coc_global_extensions = [
				\'coc-tsserver', 
				\'coc-highlight', 
				\'coc-dictionary', 
				\'coc-syntax', 
				\'coc-pairs',
				\'coc-tag', 
				\'coc-snippets',
				\'coc-ultisnips', 
				\'coc-neosnippet',
				\'coc-json', 
				\'coc-python', 
				\]

endif
" End Coc



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


"Coc NVim Tab Completion
if has("nvim")
	" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
endif

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
