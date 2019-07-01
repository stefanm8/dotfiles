#!/bin/sh

github_username="stefanm8"
github_email="stefanmihartescu@gmail.com"

curl_file() {
    echo "$(curl $1)" > $2
}

install_vim() {
    
    echo "Installing vim plugins and vimrc"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    curl_file https://raw.githubusercontent.com/stefanm8/dotfiles/master/.vimrc ~/.vimrc
    vim +PluginInstall +qall
}

install_dotfiles() {
    echo "Installing .bashrc .bash_aliases .bash_completion"
    curl_file https://raw.githubusercontent.com/stefanm8/dotfiles/master/.bashrc ~/.bashrc
    curl_file https://raw.githubusercontent.com/stefanm8/dotfiles/master/.bash_aliases ~/bash_aliases
    curl_file https://raw.githubusercontent.com/stefanm8/dotfiles/master/.bash_completion ~/bash_completion
}


install_apps() {
    echo "Installing necessities via brew cask"
    brew update                           
    brew tap caskroom/cask                
    brew install node go jsonnet gnupg
    brew cask install docker google-chrome visual-studio-code vlc
    brew cask cleanup
    brew cleanup

}

install_kubectl() {
    echo "Installing kubectl"
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl > /usr/local/bin/kubectl
    mv kubectl /usr/local/bin/kubectl
    chmod +x /usr/local/bin/kubectl
}

install_go_dev() {
    go get github.com/gopasspw/gopass
    go get -u github.com/go-delve/delve/cmd/dlv

}

install_pip() {
    brew install python3
    echo "$(curl https://bootstrap.pypa.io/get-pip.py)" | sudo python
    pip3 install pipenv
}
install_npm_dev() {
    npm install -g @angular/cli
    npm install -g typescript
    npm install -g react 


}

change_defaults() {
    defaults write com.apple.finder AppleShowAllFiles YES

}


main() {
    git config --global user.name $github_username
    git config --global user.email $github_email

    install_vim &
    install_dotfiles & 
    install_kubectl &
    install_apps &
    install_npm_dev 
    change_defaults

}

main
