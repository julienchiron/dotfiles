#!/bin/bash
################################################################################
# Install script
# We assume that .dotfiles project is at the root of the home directory
################################################################################

if [ -f $HOME/.gitconfig ]
then
    mv $HOME/.gitconfig $HOME/.gitconfig-backup
fi

ln -nfs $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig

if [ -f $HOME/.vimrc ]
then
    mv $HOME/.vimrc $HOME/.vimrc-backup
fi

ln -nfs $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc

if [ -f $HOME/.bashrc ]
then
    mv $HOME/.bashrc $HOME/.bashrc-backup
fi

ln -nfs $HOME/.dotfiles/bash/.bashrc $HOME/.bashrc

if [ -f $HOME/.bash_profile ]
then
    mv $HOME/.bash_profile $HOME/.bash_profile-backup
fi

ln -nfs $HOME/.dotfiles/bash/.bash_profile $HOME/.bash_profile

# Claude skills
mkdir -p $HOME/.claude

if [ -e $HOME/.claude/skills ] && [ ! -L $HOME/.claude/skills ]
then
    mv $HOME/.claude/skills $HOME/.claude/skills-backup
fi

ln -nfs $HOME/.dotfiles/claude/skills $HOME/.claude/skills
