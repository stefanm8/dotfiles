# ~/.bash_aliases: executed by bash(1) for non-login shells.

# some more ls aliases
alias ll='ls -l -G'
alias la='ls -A -G'
alias ls='ls -CF -G'
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
    shell=$2
    if [ -z "$1" ]
    then 
        echo "Invalid usage --help for more"
        return 0

    fi
    if [ -z "$shell" ] 
    then
        shell=/bin/bash
    fi

    docker exec -it $1 $shell
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

gowatch() {
    if [ -z "$1" ]
    then
        echo "--help for usage"
        return 0
    fi

    if [ "$1" = "--help" ]
    then
        cat <<EOF
    gowatch
    Every seconds compiles go source fires,
    to the specified destination

    gowatch [destination_path] [go source files]
EOF
        return 0
    fi

    while sleep 1;do {
        go build -o $1 $2
    } done;
}
