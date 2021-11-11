#export PATH=/usr/local/share/python:$PATH
export PATH=/Users/leo/Library/Python/2.7/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH
export PATH=/usr/local/go/bin:$PATH

. /usr/local/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh

# +---------------------+
# | Options             |
# +---------------------+
setopt histignorespace
setopt appendhistory
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY_TIME

#alias ll='ls -lahG'
#alias l='ls -lahG'
alias ll='exa -lg --icons'
alias l='exa -lg --icons'
alias la='exa -lga --icons'
alias duf='duf --theme dark'
function sha256sum() { shasum -a 256 "$@" ; } && export -f sha256sum
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

# Terraform aliases from https://github.com/zer0beat/terraform-aliases
alias tf='terraform'
alias tfa='terraform apply'
alias tfc='terraform console'
alias tfd='terraform destroy'
alias tff='terraform fmt'
alias tfg='terraform graph'
alias tfim='terraform import'
alias tfin='terraform init'
alias tfo='terraform output'
alias tfp='terraform plan'
alias tfpr='terraform providers'
alias tfr='terraform refresh'
alias tfsh='terraform show'
alias tft='terraform taint'
alias tfut='terraform untaint'
alias tfv='terraform validate'
alias tfw='terraform workspace'
alias tfs='terraform state'
alias tffu='terraform force-unlock'
alias tfwst='terraform workspace select'
alias tfwsw='terraform workspace show'
alias tfssw='terraform state show'
alias tfwde='terraform workspace delete'
alias tfwls='terraform workspace list'
alias tfsls='terraform state list'
alias tfwnw='terraform workspace new'
alias tfsmv='terraform state mv'
alias tfspl='terraform state pull'
alias tfsph='terraform state push'
alias tfsrm='terraform state rm'
alias tfay='terraform apply -auto-approve'
alias tfdy='terraform destroy -auto-approve'
alias tfinu='terraform init -upgrade'
alias tfpde='terraform plan --destroy'

# Android SDK
ANDROID_HOME=~/Library/Android
JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
export PATH=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/platform-tools:$PATH
