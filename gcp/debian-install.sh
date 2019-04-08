# brew
sudo apt-get install build-essential curl file git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

brew install hello
brew tig ranger tmux  neovim zsh fish golang ghq


# zsh
curl -L https://raw.githubusercontent.com/migutw42/dotfiles-snippets/master/zsh/.zshrc -o ~/.zshrc
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
mkdir -p ~/.zsh/completion

# neovim
pip3 install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p .config/nvim
curl -L https://raw.githubusercontent.com/migutw42/dotfiles-snippets/master/nvim/init.vim -o ~/.config/nvim/init.vim

# tmux
curl -L https://raw.githubusercontent.com/migutw42/dotfiles-snippets/master/tmux/.tmux.conf -o ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo gem install tmuxinator
mdkir -p .config/tmuxinator
curl -L https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -o ~/.zsh/completion/tmuxinator.zsh

# asdf-vm
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.1

echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc

