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
sed -i -e 's/set draw_borders false/set draw_borders true/g' ~/.config/ranger/rc.conf 
cd /tmp
git clone https://github.com/alexanderjeurissen/ranger_devicons.git
cd ranger_devicons
cd /tmp
cd /tmpmake install
rm -rf ranger_devicons
```
