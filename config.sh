#!/bin/bash

# Desc:         Deploy's profile information to the system for the user running it.
######################################
# AUTH:         Brandon M. Graves
# Created:      29DEC2015
# Last_Edit:    29DEC2015
#######################################


# First bashrc ############
if [ -f ~/.bashrc ]; then
        rm -f ~/.bashrc
fi

ln -s ${PWD}/bashrc ~/.bashrc
##############################

# Next Vim Related Things ###

if [ -f ~/.vimrc ]; then
        rm -f ~/.vimrc
fi

ln -s ${PWD}/vimrc ~/.vimrc

if [ -f ~/.vim ]; then
        ln -s ${PWD}/colors ~/.vim/
else
        mkdir ~/.vim
        ln -s ${PWD}/colors ~/.vim/
fi
