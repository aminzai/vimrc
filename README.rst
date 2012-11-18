========================================
Aminzai's vim config setting
========================================
:Author:
    Kang-min Wang (Aminzai)
:Build Date:
    2012/11/19
:Version:
    2.1

Introduction
========================================
This verison use NeoBundle that can get the newest vim script use eazy way.

Requirment
========================================
1. Git
2. Network
#. make (Unix Link Only)
#. Vim
#. Curl

Installation
========================================

- windows
  - WindowsInstall.bat
- Linux & MacOSX
  - make install

Update
========================================
1. use vim (comaand mode), run command BundleInstall
2. use make, $make update 
* Just support Unix like system

Backup
========================================
This version can auto backup orginal config before install.

Backup directory: ${HOME}/.vim_back-${data}

* Just support Unix like system

Clean backup 
----------------------------------------
$ make clean_backup_file


Note
----------------------------------------
After installed, must be update vimproc and :NeoBundleInstall

- Vimproc:
    "After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile"

