if has('unix')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
  source ~/.vimrc
elseif has('win32')
  set runtimepath^=~/AppData\Local\vim runtimepath+=~/AppData\Local\vim/after
  let &packpath = &runtimepath
  source ~/AppData\Local\vimrc 
endif
