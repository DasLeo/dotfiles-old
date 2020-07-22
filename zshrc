#export PATH=/usr/local/share/python:$PATH
export PATH=/Users/leo/Library/Python/2.7/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH

. /usr/local/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

# +---------------------+
# | Options             |
# +---------------------+
setopt histignorespace

alias ll='ls -lahG'
alias l='ls -lahG'
export LANG=en_US.UTF-8

# function to capture fields using awk
function aprint() { awk "{print \$${1:-1}}"; }

# function to watch for fully started COYO backends
alias backendstarted='rancher logs -f coyo/coyo-backend | grep -i "started app"'
alias backup-coyo-postgres="rancher exec -it coyo/coyo-db pg_dump --dbname coyo --username=postgres -F custom -f /var/lib/postgresql/data/$(date +%Y-%m-%d-%H-%M-%S).dump"

# pip3, python3 and python3-config are synlinked by brew to /usr/local/bin
# but if this fails you can prefer the python bin path in your PATH
#export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# Python 3 is my default version
alias python=/usr/local/bin/python3.8
