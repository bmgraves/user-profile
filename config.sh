#!/bin/bash

# Desc: Deploy's profile information to the system for the user running it.
######################################
# AUTH:         Brandon M. Graves
# Created:      29DEC2015
# Last_Edit:    31DEC2015
#######################################


# First bashrc ############
if [ -f ~/.bashrc ]; then
        rm -f ~/.bashrc
	ln -s ${PWD}/shell-manager/bashrc ~/.bashrc
else
	ln -s ${PWD}/shell-manager/bashrc ~/.bashrc
fi

##############################

# Next Vim Related Things ###

if [ -f ~/.vimrc ]; then
	rm -f ~/.vimrc
	ln -s ${PWD}/vim-manager/vimrc ~/.vimrc
else
	ln -s ${PWD}/vim-manager/vimrc ~/.vimrc
fi

if [ -d ~/.vim ]; then
	unlink ~/.vim
  	ln -s ${PWD}/vim-manager/vim ~/.vim
else
        ln -s ${PWD}/vim-manager/vim ~/.vim
fi
if [ ! -d ~/.config/ ]; then
	mkdir ~/.config
fi

if [ -d ~/.config/nvim ]; then
	unlink ~/.config/nvim
  	ln -s ${PWD}/vim-manager/nvim ~/.config/nvim
else
        ln -s ${PWD}/vim-manager/nvim ~/.config/nvim
fi

if [ -d ~/.vim/plugged ]; then
   echo "Plugged exists, continuing"
else
  mkdir ~/.vim/plugged
fi
##########################################
### TMUX

if [ -f ~/.tmux.conf ]; then
	rm -f ~/.tmux.conf
	ln -s ${PWD}/tmux-manager/tmux.conf ~/.tmux.conf
else
	ln -s ${PWD}/tmux-manager/tmux.conf ~/.tmux.conf
fi

##
