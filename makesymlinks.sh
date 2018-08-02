#!/bin/bash
########################
# .make.sh
# This script creates symlinks from the home directory to any desired
# dotfiles in ~/dotfiles
# Borrowed from michaeljsmally: https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
########################

######### Variables

dir=~/dotfiles
olddir=~/doftfiles_old
files="bashrc vimrc vim zshrc oh-my-zsh tmux.conf"

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "... done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory"
cd $dir
echo "... done"

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks from the homedir to any files in the ~/dotfiles
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/doftfiles_old/
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/.$file
done
