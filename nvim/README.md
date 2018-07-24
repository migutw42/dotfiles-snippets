# Neovim

## インストール
Wiki参照
> https://github.com/neovim/neovim/wiki/Installing-Neovim

Python3とpip3も必要

```
# Python3はパッケージマネージャーか、asdｆで入れる
$ pip3 install neovim
```

## プラグインマネージャー
以下のコマンドで入れる

```
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## 設定ファイルパス

```
~/.config/nvim/init.vim
```
