#!/bin/bash

TIMESTAMP=`date "+%Y-%m-%d-%H:%M:%S"`
VIMRC=${HOME}/.vimrc
VIMRC_BAK=${HOME}/.vimrc-$TIMESTAMP
VIMRC_LOCAL=${PWD}/_vimrc

GVIMRC=${HOME}/.gvimrc
GVIMRC_BAK=${HOME}/.gvimrc-$TIMESTAMP
GVIMRC_LOCAL=${PWD}/_gvimrc

VIM_FOLDER=${HOME}/.vim
VIM_FOLDER_BAK=$VIM_FOLDER-$TIMESTAMP
VIM_FOLDER_LOCAL=${PWD}

RED="\033[0;31m"
LIGHT_BLUE="\033[1;34m"
NC="\033[0m"

echo -e "${LIGHT_BLUE}Start install vim settings....$NC"

backup_file () {
	echo -e "${RED}${1} is already exist!${NC}"
	read -p "Would you like to backup ${1}? [y/n]" ANS
	if [ "$ANS" == "y" ]; then
		echo "Backup original ${1} to ${2}"
		mv ${1} ${2}
	else
		echo -e "${LIGHT_BLUE}Bye!${NC}"
		exit
	fi
}

file_check () {
	if [ -L ${1} ] || [ -f ${1} ]; then
		backup_file ${1} ${2}
	fi
}

folder_check () {
	if [ -d ${1} ]; then
		backup_file ${1} ${2}
	fi
}

install_files() {
	ln -sf ${VIM_FOLDER_LOCAL} ${VIM_FOLDER}
	ln -sf ${VIMRC_LOCAL} ${VIMRC}
	ln -sf ${GVIMRC_LOCAL} ${GVIMRC}
	cd ${VIM_FOLDER}
	git submodule init
	git submodule update
	echo -e "${LIGHT_BLUE}Done!${NC}"
}
	
if [ "${1}" == "-f" ]
then
	for ITEM in ${VIM_FOLDER} ${VIMRC} ${GVIMRC}
	do
		rm -rf ${ITEM}
	done
	install_files
else
	folder_check ${VIM_FOLDER} ${VIM_FOLDER_BAK}
	file_check ${VIMRC} ${VIMRC_BAK}
	file_check ${GVIMRC} ${GVIMRC_BAK}
	install_files
fi
