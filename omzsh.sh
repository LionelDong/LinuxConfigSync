#!/usr/bin/env bash
#
#**************************************************
# Author:         Lionel Dong                      
# Email:          demondonglongfei1995@gmail.com   
# Date:           2024-03-25        
# Description:                                     
#**************************************************

# ============== 安装 git zsh wget ==============
cd /root
if [ -x "$(command -v yum)" ]; then
    echo ' use yum'>&2
    yum install git -y
    yum install zsh -y
    yum install wget -y
    yum install curl -y
    yum install tmux -y
    # nvim
    # yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    # yum install -y neovim python3-neovim

    # tmux dependencies
    # yum install autogen automake libevent-dev libncurses5-dev -y
fi

if [ -x "$(command -v apt-get)" ]; then
    echo 'use apt-get'>&2
    apt-get install git -y
    apt-get install zsh -y
    apt-get install wget -y
    apt-get install curl -y
    apt-get install tmux -y
    # nvim
    # apt-get install neovim -y

    # tmux dependencies
    # apt-get install autogen automake libevent-dev libncurses5-dev -y
fi
# ===================================


# ============== 安装配置 oh-my-zsh ==============
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10kgit clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k

if [ -f "$HOME/.zshrc" ]; then
     mv $HOME/.zshrc $HOME/.zshrc.bk
fi

if [ -f "$HOME/.p10k.zsh" ]; then
     mv $HOME/.p10k.zsh $HOME/.p10k.zsh.bk
fi



# 下载 .zshrc
wget -P $HOME https://raw.githubusercontent.com/LionelDong/LinuxConfigSync/main/.zshrc
# 下载 .p10k
wget -P $HOME https://raw.githubusercontent.com/LionelDong/LinuxConfigSync/main/.p10k.zsh


# ===================================


# # nvim conf
# mkdir /root/.config
# mkdir /root/.config/nvim
# wget -O /root/.confg/nvim/init.vim https://raw.githubusercontent.com/kong5664546498/half_a_wheel/master/wheel/conf/init.vim


# # tmux 
# git clone https://github.com/tmux/tmux.git
# cd tmux
# sh autogen.sh
# ./configure && make

# # tmux conf
# cd /root
# git clone https://github.com/gpakosz/.tmux.git
# ln -s -f .tmux/.tmux.conf
# cp .tmux/.tmux.conf.local .


# ============== gotop ==============
# git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop

# /tmp/gotop/scripts/download.sh

# mv ./gotop /usr/bin
# ===================================

# autojump
#git clone git://github.com/wting/autojump.git
#cd autojump
#./install.py

# the fuck
# pip3 install thefuck

# nvim-pulg
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# 修改默认 bash
sudo chsh -s /bin/zsh
zsh

exit 0


