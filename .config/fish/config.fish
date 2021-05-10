# sample setting
# set -x PATH $PATH /sbin/
#
# function ll
#     ls -lh $argv
# end
#

alias vim=nvim
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export EDITOR=vim
export SNIPPET=/home/kiona/snippet

pyenv init - | source
pyenv shell 3.8.4
