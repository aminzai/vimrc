#!/bin/sh
git pull origin master
git submodule init
git submodule update
git submodule update --init --recursive
git submodule foreach git submodule init
git submodule foreach git submodule update
#git submodule foreach git pull
git submodule foreach git pull origin master


#Compile YouCompleteMe
CUR=${PWD}
cd bundle/YouCompleteMe/
./install.sh
cd ${CUR}
