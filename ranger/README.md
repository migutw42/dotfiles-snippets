# Ranger

## インストール
パッケージマネージャーで入れる。

## セットアップ
以下のコマンドを実行

```
$ ranger --copy-config=all
$ sed -i -e 's/set draw_borders false/set draw_borders true/g' ~/.config/ranger/rc.conf 
```
