#!/bin/sh
#====================================================================
# package
#====================================================================
yes | sudo apt update
yes | sudo apt upgrade
yes | sudo apt install texlive-full
yes | sudo apt install texlive-lang-japanese
yes | sudo apt-get install texlive-fonts-recommended
yes | sudo apt install xdvik-ja
yes | sudo apt install gv
yes | sudo apt install perl
#====================================================================
# config / dotfile
#====================================================================
sudo kanji-config-updmap-sys ipaex
echo '#!/usr/bin/perl' > ~/.latexmkrc
echo \$latex\ =\ \'platex\ -kanji=utf-8\ -synctex=1\ %S\'\; >> ~/.latexmkrc
echo \$dvipdf\ =\ \'dvipdfmx\ %O\ -o\ %D\ %S\'\; >> ~/.latexmkrc
echo \$bibtex\ =\ \'pbibtex\'\; >> ~/.latexmkrc
echo \$makeindex\ =\ \'mendex\ %O\ -o\ %D\ %S\'\; >> ~/.latexmkrc
echo \$pdf_mode\ =\ 3\; >> ~/.latexmkrc
echo \$pdf_update_method\ =\ 2\; >> ~/.latexmkrc
echo \$pdf_previewer\ =\ \'\"/mnt/c/Program Files/SumatraPDF/SumatraPDF.exe\"\ -reuse-instance\ %O\ %S\'\; >> ~/.latexmkrc
echo \$max_repeat\ =\ 5\; >> ~/.latexmkrc
echo \$pvc_view_file_via_temporary\ =\ 0\; >> ~/.latexmkrc
#====================================================================
# perl5 support
#====================================================================
mkdir tmp
cd tmp
wget http://mirrors.ctan.org/support/latexmk.zip
unzip latexmk.zip
sudo cp latexmk/latexmk.pl /usr/bin/latexmk
#====================================================================
# software install
#====================================================================
mkdir /mnt/c/User/Public/Downloads
cd /mnt/c/User/Public/Downloads
wget https://www.sumatrapdfreader.org/dl/SumatraPDF-3.1.2-64-install.exe
echo '#################################'
echo '### Please install SumatraPDF ###'
echo '#################################'
cmd.exe /c start SumatraPDF-*-install.exe
#====================================================================
# message
#====================================================================
echo '[Usage]'
echo '1. compile: $ latexmk hogehoge.tex'
echo '2. auto compile: $ latexmk -pvc hogehoge.tex'
echo '3. remove intemediate file: $ latexmk -c hogehoge.tex'
