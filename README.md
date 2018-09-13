# dotfiles
mac用Dotfileリポジトリ。　　
開発環境構築時の効率化が目的。　　
随時更新の予定。

## インストール後に入手できるもの
- linuxコマンドのalias
- Gitコマンドのalias
- neovimの設定
- vimの設定

## 開発環境導入の大まかな手順
1. Homebrewのインストール 
1. ターミナルのカラー設定
1. ターミナルのフォント設定 
1. neovimのインストール
1. deinのためにpython3をインストール
1. 本リポジトリをクローン
1. シェル実行
1. deinの再インストール
1. deinでnvimのプラグインをinstall

## 導入詳細
### Homebrewのインストール
[Homebrewサイト](https://brew.sh/index_ja)
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### ターミナルのカラー設定
Proを使用。  
不透明度は95%に設定する。
### ターミナルのフォント設定
Ricty Diminishedを使用。  
[Ricty Diminished](https://www.rs.tus.ac.jp/yyusa/ricty.html)

```
brew tap caskroom/fonts
brew cask install font-ricty-diminished
```
インストール後にターミナル環境設定から  
**Ricty Diminished Regular 18pt.**  
を選択。

### neovimのインストール
[neovim公式](https://neovim.io/)  
[neovim git](https://github.com/neovim/neovim/wiki/Installing-Neovim)
```
brew install neovim
```

### deinのためにpython3をインストール
```
brew install python3
pip3 install -U neovim
```

### 本リポジトリをクローン

```
cd ~/
git clone https://github.com/yuki-yoshida-z/dotfiles.git
```
確認
```
cd dotfiles
ls
```
色々ファイルがあればok。

### シェル実行
```
sh dotfiles.sh
```

### deinの再インストール
[dein](https://github.com/Shougo/dein.vim)  
すでにdeinはnvimの設定の中に含まれているが、  
なぜか動かない。  
原因を探すより、再インストールした方が早いため再インストールする。  

暇ができたら原因を探す。  

既存のdeinを削除
```
cd ~/dotfiles/nvim
rm -rf dein
```

deinの再インストール
```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/dotfiles/nvim/dein
```

### deinでnvimのプラグインをinstall
nvim起動
```
nvim
```
プラグインのインストール
```
:call dein#install()
```


