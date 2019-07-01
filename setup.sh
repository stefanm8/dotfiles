#!/bin/sh


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



main() {
    git config --global user.name "stefanm8"
    git config --global user.email stefanmihartescu@gmail.com

    install_vim
    install_dotfiles 
    install_kubectl
    install_apps


}

main
