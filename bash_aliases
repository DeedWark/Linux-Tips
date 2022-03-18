#ls
alias ls='ls --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -l'

#grep
alias grep='grep --color -n'

#PYTHON
alias webdir='python ~/.webdir/.webdir.py'

#TAR
alias untar='tar xzvf'
alias compress='tar czvf'

#NETSTAT
#check openned ports TCP/UDP
alias ports='netstat -nuta'

#NETCAT 
#check if port is open -> checkport <ip> <port>
alias checkport='nc -zv'

#DIG   -> You can create a .digrc file with "+nocmd +noall +answer" in
alias dig='dig +nocmd +noall +answer'

#IP
alias publicIP='curl ifconfig.io'

#VIM
alias v='vim'
alias V='vim'

#PYTHON
alias setenv='python3 -m venv'
alias setenv2='python -m venv'

#KITTERMAN/SPF
alias kitterman='docker run --rm deedwark/spftools'

#DOMAIN
dmarc () { dig txt _dmarc.$1 }

#DOCKER
enter () { docker start $1 && docker exec -it $1 /bin/bash }
dstart () { docker start -ai $1 }

#PODMAN
alias pod='podman'

#7Z
alias 7pass='echo "7z a dir.7z file -p"'

#Termbin
alias termbin="nc termbin.com 9999"

#IP
alias ipaddress="ip addr | grep -o 'inet [0-9]\+.[0-9]\+.[0-9]\+.[0-9]\+' | cut -d' ' -f2"

#DOMAIN
#dmarc () { dig txt _dmarc.$1 }

#SIZE
alias realsize='du -sh * 2>/dev/null|sort -n'

#EXA - LS
alias lls='exa -l -@'
alias ld='exa -D'
alias la='exa -a'
alias llo='exa -l --octal-permissions'

#SUDO
alias ⁼='sudo -i'
alias ⁺='sudo su'
alias ⁽⁼⁾='echo $SHELL'
alias œ="sudo -i"

#TMUX
alias tnew='tmux new'
alias tn='tmux new'
alias ta='tmux a'

#GIT
alias github='git config --global user.name "###" ; git config --global user.email "###@##.##" ; git'
alias gitlab='git config --global user.name "###" ; git config --global user.email "###@##.##" ; git'

#KUBERNETES
alias kubectl='microk8s.kubectl'

#MAN
alias man='man++'

#REALCOUNT
realcount() { < $1 grep -vE "(^#|^$|^\/)" |wc -l }

#RANDOM
alias random_token='tr -dc "a-zA-Z0-9" < /dev/urandom|fold -w 32|head -n1'
alias rtoken='tr -dc "a-zA-Z0-9" < /dev/urandom|fold -w 32|head -n1'
alias token='tr -dc "a-zA-Z0-9" < /dev/urandom|fold -w 32|head -n1'
