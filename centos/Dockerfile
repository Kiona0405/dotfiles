FROM centos:7

WORKDIR /root

# yum package install
RUN yum -y update
COPY /yum_list.txt yum_list.txt
RUN yum groupinstall -y "Development Tools"\
    && yum install -y centos-release-scl\
    && yum-config-manager --enable rhel-server-rhscl-7-rpms\
    && yum install -y devtoolset-8\
    && scl enable devtoolset-8 bash
RUN cat yum_list.txt | xargs yum install -y
RUN wget https://cmake.org/files/v3.12/cmake-3.12.3.tar.gz\
    && tar zxvf cmake-3.*\
    && cd cmake-3.*\
    && ./bootstrap \
    && make -j$(nproc)\
    && make install\
    && ln -s /usr/bin/cmake3 /usr/bin/cmake



# language
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"

# autoconf
RUN    wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz\
    && cd /root\
    && gunzip autoconf-2.69.tar.gz\
    && tar xvf autoconf-2.69.tar\
    && cd autoconf-2.69\
    && ./configure\
    && make\
    && make install

# automake
RUn    wget http://ftp.gnu.org/gnu/automake/automake-1.14.tar.gz\
    && tar xvzf automake-1.14.tar.gz\
    && cd automake-1.14\
    && ./configure\
    && make\
    && make install

# neovim
RUN    git clone https://github.com/neovim/neovim\
    && cd neovim\
    && git checkout stable\
    && make\
    && make install\
    && easy_install-3.6 pip\
    && pip3 install neovim

# vim-plug
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf\
    && ~/.fzf/install

# deploy dotfiles
RUN git clone https://github.com/Kiona0405/dotfiles.git /root/dotfiles\
    && mkdir -p /root/.config && cp -r /root/dotfiles/nvim /root/.config/nvim\
    && cp -r /root/dotfiles/.tmux.conf /root/.tmux.conf

# nvim plugins
RUN nvim +PlugInstall +q +q 

# YouCompleteMe
RUN cd /root/.vim/plugged/YouCompleteMe\
    && git submodule update --init --recursive\
    && source /opt/rh/devtoolset-8/enable\
    && python3 ./install.py --clang-completer\
    && cp ~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~
