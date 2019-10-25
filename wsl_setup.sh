#!/bin/sh
#====================================================================
# 事前用意
#====================================================================
# Cmder
# X-windwos: https://sourceforge.net/projects/vcxsrv/
#====================================================================
# 一時フォルダ
#====================================================================
mkdir tmp
cd tmp
#====================================================================
# aptのアップデート
#====================================================================
yes | sudo apt update
yes | sudo apt upgrade
#====================================================================
# デスクトップがフリーズした場合に備えて「Ctrl+Alt+Backspace」で強制終了を有効化
#====================================================================
sudo dpkg-reconfigure keyboard-configuration
#====================================================================
# ソフトウェアインストール
#====================================================================
yes | sudo apt install git
yes | sudo apt install xsel
yes | sudo apt install openjdk-11-jdk
#====================================================================
# python開発環境構築
#====================================================================
yes | sudo apt install python3 python3-pip python3-venv python3-dev
#====================================================================
# pipで入れるツール
#====================================================================
yes | pip3 install python-pptx
yes | pip3 install docopt
#====================================================================
# GUI環境構築
#====================================================================
yes | sudo apt install xfce4-terminal
yes | sudo apt install xfce4
#====================================================================
# ドットファイル
#====================================================================
git clone https://github.com/takushooo/dotfile.git