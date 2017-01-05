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
	echo ".vim already exists, please remove it, and re-run this config"
else
        ln -s ${PWD}/vim ~/.vim
fi
if [ -d ~/.vimpkg ]; then
	echo ".vimpkg already exists, please remove it, and re-run this config"
else
        ln -s ${PWD}/vimpkg ~/.vimpkg
        ln -s ${PWD}/vimpkg/bundle ${PWD}/vim/bundle
fi
