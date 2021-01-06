# Ranger

## インストール
パッケージマネージャーで入れる。

```bash
# Mac
brew install ranger

# debian
sudo apt install ranger
```

## セットアップ
以下のコマンドを実行

```bash
ranger --copy-config=all
sed -i -e 's/set draw_borders none/set draw_borders both/g' ~/.config/ranger/rc.conf 
sed -i -e 's/# set preview_images false/set preview_images true/g' ~/.config/ranger/rc.conf 

git clone https://github.com/alexanderjeurissen/ranger_devicons.git
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf
```
