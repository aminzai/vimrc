#!/bin/sh
git submodule update --init --recursive

#Compile YouCompleteMe
CUR=${PWD}
cd bundle/YouCompleteMe/
./install.sh --clang-completer
cd ${CUR}
ln -sf ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~/.ycm_extra_conf.py
