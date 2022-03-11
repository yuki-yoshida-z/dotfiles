# dotfiles
mac用Dotfileリポジトリ。   
開発環境構築時の効率化が目的。   
随時更新の予定。

## インストール後に入手できるもの
- linuxコマンドのalias
- Gitコマンドのalias
- neovimの設定
- vimの設定
- Dockerのalias

## 開発環境導入の大まかな手順
1. Homebrewのインストール 
1. anyenvのインストール
1. ターミナルのカラー設定
1. ターミナルのフォント設定 
1. neovimのインストール
1. deinのためにpython3をインストール
1. fzfのインストール
1. ripgrepのインストール
1. batのインストール
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

### anyenvのインストール
各言語のバージョンを一括管理する
開発環境導入時では最低限のものを入れる
1. nodenv(vue cliなど使う想定)
1. pyenv(nvimのdeopleteで使用)

[anyenv github](https://github.com/anyenv/anyenv)

#### インストール
```
$ brew install anyenv
```
```
$ anyenv install --init
Manifest directory doesn't exist: /Users/[your_account]/.config/anyenv/anyenv-install
Do you want to checkout ? [y/N]: y #質問にはyで答える
<中略>

#シェル更新
$ exec $SHELL -l

#最初は何もないはずだがインストールの確認
$ anyenv versions

```

#### anyenvプラグインのインストール
```
# ディレクトリ作成
$ mkdir -p ~/.anyenv/plugins

# anyenv-update
# anyenv updateコマンドでanyenvで入れた**env系の全てをアップデートしてくれるプラグイン
$ git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update

# anyenv-git
# anyenv gitコマンドでanyenvで入れた**env系の全てのgitコマンドを実行するプラグイン
$ git clone https://github.com/znz/anyenv-git.git ~/.anyenv/plugins/anyenv-git
```

#### nodenvとpyenvとrbenvのインストール
```
$ anyenv install nodenv

$ anyenv install pyenv

$ anyenv install rbenv

$ exec $SHELL -l
```

#### nvim用にpython3系をインストール
```
# インストール可能なバージョンのリスト
$ pyenv install -l

#上記結果から3系の最新をインストール
$ pyenv install 3.x.x

$ exec $SHELL -l
```

#### LSPに使用するnode.jsのバージョンをインストール
```
# インストール可能なバージョンのリスト
$ nodenv install -l

#上記結果からlspで使用したいバージョンをインストール
$ nodenv install x.x.x

$ exec $SHELL -l
```

#### LSPに使用するrubyのバージョンをインストール
```
# インストール可能なバージョンのリスト
$ rbenv install -l

#上記結果からlspで使用したいバージョンをインストール
$ rbenv  install x.x.x

$ exec $SHELL -l
```


### ターミナルのカラー設定
Proを使用。  
不透明度は95%に設定する。
### ターミナルのフォント設定
Ricty Diminishedを使用。  
[Ricty Diminished github](https://github.com/edihbrandon/RictyDiminished)

1. githubからソースをダウンロードと解凍
1. macでfont Bookを起動
1. 左メニューのユーザーをクリック
1. フォントリスト欄を右クリックしてフォントを追加
1. ダウンロードしたファイルを選択

インストール後にターミナル環境設定から  
**Ricty Diminished Regular 14pt.**  
を選択。

### neovimのインストール
[neovim公式](https://neovim.io/)  
[neovim git](https://github.com/neovim/neovim/wiki/Installing-Neovim)
```
brew install neovim
```

### dein用にpython3をインストール
```
pip3 install -U neovim
```

### fzfのインストール
```
brew install fzf

(brew --prefix)/opt/fzf/install
```

###  ripgrepのインストール
```
brew install ripgrep
```

###  batのインストール
```
brew install bat
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
### deinのインストール
```
cd ~/dotfiles/nvim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.config/nvim/dein
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


