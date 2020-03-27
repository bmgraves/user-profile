if has('unix')
  " set guicursor=
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
  source ~/.vimrc
elseif has('win32')
  set runtimepath^=~/AppData\Local\UserProfile\vim runtimepath+=~/AppData\Local\UserProfile\vim/after
  let &packpath = &runtimepath
  source ~/AppData\Local\UserProfile\vimrc 
endif
