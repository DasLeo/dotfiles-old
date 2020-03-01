#export PATH=/usr/local/share/python:$PATH
export PATH=/Users/leo/Library/Python/2.7/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH

. /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

# +---------------------+
# | Options             |
# +---------------------+
setopt histignorespace

alias ll='ls -lahG'
alias l='ls -lahG'
export LANG=en_US.UTF-8

# function to capture fields using awk
function aprint() { awk "{print \$${1:-1}}"; }
