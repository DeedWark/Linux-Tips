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
