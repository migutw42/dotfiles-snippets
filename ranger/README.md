# Ranger

## インストール
パッケージマネージャーで入れる。

## セットアップ
以下のコマンドを実行

```
ranger --copy-config=all
sed -i -e 's/set draw_borders false/set draw_borders true/g' ~/.config/ranger/rc.conf 
cd /tmp
git clone https://github.com/alexanderjeurissen/ranger_devicons.git
cd ranger_devicons
cd /tmp
cd /tmpmake install
rm -rf ranger_devicons
```
