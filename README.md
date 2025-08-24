# dotfiles
mac用Dotfileリポジトリ。   
開発環境構築時の効率化が目的。   
随時更新の予定。

## インストール後に設定されるもの
- linuxコマンドのalias
- Gitコマンドのalias
- Dockerコマンドのalias
- neovimの設定

## 開発環境導入の大まかな手順
1. Homebrewのインストール
1. anyenvのインストール
1. ターミナルのカラー設定
1. ターミナルのフォント設定
1. fzfのインストール
1. ripgrepのインストール
1. batのインストール
1. neovimのインストール
1. 本リポジトリをクローン
1. シェル実行

## 環境構築までに必要なパッケージ
各公式ドキュメントを参照してインストールする
### Homebrewのインストール
[Homebrewサイト](https://brew.sh/index_ja)

### anyenvのインストール
[anyenv github](https://github.com/anyenv/anyenv)

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

### ターミナルのカラー設定
Proを使用。  
不透明度は95%に設定する。
### ターミナルのフォント設定
font-jetbrains-mono-nerd-fontをinstallしてターミナルの設定でフォントを選択する

```
brew install --cask font-jetbrains-mono-nerd-font
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
### neovimのインストール
[neovim公式](https://neovim.io/)  
[neovim git](https://github.com/neovim/neovim/wiki/Installing-Neovim)
```
brew install neovim
```
#### copilotの設定
nvim上で:Copilot setupを実行し、GitHubの認証を行う

## Dotfilesの適用
上記のパッケージをインストール後に以下を実装
```
sh dotfiles.sh
```
