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
	ln -s ${PWD}/bashrc ~/.bashrc
else
	ln -s ${PWD}/bashrc ~/.bashrc
fi

##############################

# Next Vim Related Things ###

if [ -f ~/.vimrc ]; then
	rm -f ~/.vimrc
	ln -s ${PWD}/vimrc ~/.vimrc
else
	ln -s ${PWD}/vimrc ~/.vimrc
fi

if [ -d ~/.vim ]; then
	if [ -f ~/.vim/colors ]; then
		rm -f ~/.vim/colors
        	ln -s ${PWD}/colors ~/.vim/
	else
        	ln -s ${PWD}/colors ~/.vim/
	fi
else
        mkdir ~/.vim
        ln -s ${PWD}/colors ~/.vim/
fi
