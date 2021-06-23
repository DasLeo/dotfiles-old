#export PATH=/usr/local/share/python:$PATH
export PATH=/Users/leo/Library/Python/2.7/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH

. /usr/local/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh

# +---------------------+
# | Options             |
# +---------------------+
setopt histignorespace
setopt appendhistory
HISTSIZE=10000
SAVEHIST=10000

#alias ll='ls -lahG'
#alias l='ls -lahG'
alias ll='exa -lg --icons'
alias l='exa -lg --icons'
alias la='exa -lga --icons'
export LANG=en_US.UTF-8

# function to capture fields using awk
function aprint() { awk "{print \$${1:-1}}"; }

# function to watch for fully started COYO backends
alias backendstarted='rancher logs -f coyo/coyo-backend | grep -i "started app"'
alias backup-coyo-postgres="rancher exec -it coyo/coyo-db pg_dump --dbname coyo --username=postgres -F custom -f /var/lib/postgresql/data/$(date +%Y-%m-%d-%H-%M-%S).dump"
alias deploy-support-container='rancher run -i -t -v /srv/encrypted/coyo-data:/data -p 9022:22 --label io.rancher.scheduler.affinity:host_label=coyo.host.class=monitoring --name support/sd-client alpine'
alias chromium-flash='nohup -- ~/Applications/Chromium.app/Contents/MacOS/Chromium --ppapi-flash-path=/Library/Internet\ Plug-Ins/PepperFlashPlayer/PepperFlashPlayer.plugin --ppapi-flash-version=32.0.0.387 &'
alias grep-branches="git branch -a | tr -d \* | sed '/->/d' | xargs git grep"
alias cleanup_dsstore="find . -name '.DS_Store' -type f -delete"

# Kubernetes
# Autocompletion
autoload -Uz compinit
compinit
source <(kubectl completion zsh)
source <(helm completion zsh)
# aliases
alias k='kubectl'
alias ksys='kubectl --namespace=kube-system'
# Krew (kubectl plugin manager)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# pip3, python3 and python3-config are synlinked by brew to /usr/local/bin
# but if this fails you can prefer the python bin path in your PATH
#export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# Python 3 is my default version
alias python=/usr/local/bin/python3.9
