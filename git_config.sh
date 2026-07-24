#!/bin/bash

git config --global user.name "deimos"
git config --global user.email deimoshall.dev@proton.me
git config --global core.editor "nvim"
git config --global init.defaultBranch main
# true for Windows systems and input for Linux and Mac
# git config --global core.autocrlf true
git config --global core.autocrlf input
git config --global credential.helper store
# Set origin as default because I use Codeberg as a mirror
git config --global checkout.defaultRemote origin

echo "Configuration applied:"
git config --global --list
