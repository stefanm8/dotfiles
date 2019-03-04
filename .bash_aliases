# ~/.bash_aliases: executed by bash(1) for non-login shells.

# some more ls aliases
alias ll='ls -l -G'
alias la='ls -A -G'
alias ls='ls -CF -G'
alias ls='ls -G'
alias lt='ls -alt -G'

alias grep='grep --color=always'
alias drop_caches='sync; sudo sysctl -w vm.drop_caches=3'
# Kills all containers
alias kill_containers="docker ps | awk 'FNR>1{print \$1}' | xargs docker stop"
alias runcassandra="docker run -p '9042:9042' -v $HOME/Development/persistence/cassandra:/var/lib/cassandra cassandra"

#Wifi CLI 
alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport

alias lshttp="lsof -i :22"
alias lshttps="lsof -i :443"

# ssh into a container
sshdocker()
{
    docker exec -it $1 /bin/sh
}

# Opens multiple files horizontally 
vimh() {
    vim -o $@
}

# Opens multiple files vertically 
vimv() {
    vim -O $@
}

kerberosinit() {
    kinit --renewable --lifetime=36000 --ok-as-delegate --forwardable --keychain --windows  --request-pac --verbose $1
}
