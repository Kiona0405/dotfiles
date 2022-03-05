FROM ubuntu:18.04
MAINTAINER Kiona0405 

# update and install dependencies
RUN apt-get update
RUN apt-get install -y software-properties-common wget\
    && wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add -\
    && apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'\
    && apt-get update

ARG DEBIAN_FRONTEND=noninteractive

# apt-get package install
COPY /apt_list.txt /root/apt-get_list.txt
RUN cat /root/apt-get_list.txt | xargs apt-get install -y

# neovim install
RUN cd /root\
    && git clone https://github.com/neovim/neovim\
    && cd neovim\
    && git checkout stable\
    && make\
    && make install
RUN pip3 install neovim\
    && pip install neovim

RUN cd /root/\
    && wget https://www.openssl.org/source/openssl-1.1.1g.tar.gz\
    && tar xvf openssl-1.1.1g.tar.gz\
    && cd openssl-1.1.1g\
    && ./config\
    && make\
    && make install

# user
RUN adduser --shell /bin/bash --disabled-password\
    --home /home/naoki --gecos '' naoki\
    && adduser naoki sudo\
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER naoki

WORKDIR /home/naoki

# vim-plug
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf\
    && ~/.fzf/install

# deploy dotfiles
RUN git clone https://github.com/Kiona0405/dotfiles.git ~/dotfiles\
    && mkdir -p ~/.config\
    && cp -r ~/dotfiles/nvim ~/.config/nvim\
    && cp -r ~/dotfiles/.tmux.conf ~/.tmux.conf

# nvim plugins
RUN nvim +PlugInstall +q +q 

# YouCompleteMe
RUN cd ~/.vim/plugged/YouCompleteMe\
    && git submodule update --init --recursive\
    && CC=gcc-8 CXX=g++-8 python3 ./install.py --clang-completer\
    && cp ~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~

# locale
RUN sudo rm -rf /var/lib/apt/lists/* \
    && sudo localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
ENV TERM=screen-256color
