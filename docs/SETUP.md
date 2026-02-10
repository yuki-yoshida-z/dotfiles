# セットアップ
開発環境構築の手順をまとめる。

## 開発環境導入の大まかな手順
1. Xcode Command Line Toolsのインストール
1. Homebrewのインストール
1. 本リポジトリをクローン
1. Brewfileでbrew bundle
1. Terminal.appのプロファイル適用
1. local-setupでlocalファイル作成
1. 各localファイルを編集
1. make init

## セットアップ手順
1. Xcode Command Line Toolsをインストール
```
xcode-select --install
```

2. Homebrewをインストール

3. 本リポジトリをクローン

4. Homebrewパッケージを適用（共有分）
```
brew bundle --file ~/dotfiles/Brewfile
```

5. Terminal.appのプロファイルを適用
```
# GUIで terminal-2026.terminal をインポートして使用
# 具体的な手順は「Terminal.appのプロファイル適用」を参照
```

6. ローカル設定ファイルを作成
```
make local-setup
```

7. `~/dotfiles/.gitconfig.local`を編集してGitのユーザー情報を設定
```
# ~/dotfiles/.gitconfig.local を開いて編集
# user.name と user.email を設定
```

8. 端末固有のbash設定を必要に応じて編集
```
# ~/dotfiles/.bashrc.local を開いて編集
# 端末固有のPATHやgcloudの設定など
```

9. 端末固有のHomebrewパッケージを必要に応じて編集
```
# ~/dotfiles/.Brewfile.local を開いて編集
```

10. Dotfilesを適用
```
make init
```

11. Homebrewパッケージを適用（端末固有分）
```
[ -f ~/dotfiles/.Brewfile.local ] && brew bundle --file ~/dotfiles/.Brewfile.local
```
※ `~/dotfiles/.Brewfile.local` は端末固有用で、リポジトリでは管理しません。

## 言語ランタイムのインストール（anyenv）
anyenv導入済み前提でRuby/Node.jsを入れる。

1. anyenvの初期化
```
anyenv install --init
exec $SHELL -l
```

2. rbenv/nodenvをインストール
```
anyenv install rbenv
anyenv install nodenv
exec $SHELL -l
```

3. Ruby/Node.jsをインストール（例）
```
rbenv install 3.3.6
rbenv global 3.3.6

nodenv install 20.11.1
nodenv global 20.11.1
```

## Terminal.appのプロファイル適用
Terminal.appのUIから`terminal-2026.terminal`ファイルをインポートして適用する。<br>
※ macOSのUIはアップデートで変わる可能性があるため、2026年2月10日時点の手順を記載。

### インポート手順（2026年2月10日時点）
1. Terminal.app を開く
1. `Terminal > 設定...` を開く
1. `プロファイル` タブを選択
1. `アクション`（歯車アイコン）メニューから `読み込む` を選び、`terminal-2026.terminal` を指定  
   もしくは Finder から `terminal-2026.terminal` をプロファイル一覧へドラッグ&ドロップ

### 既定プロファイルの設定（任意）
1. `Terminal > 設定...` → `一般` タブ
1. 「起動時に開く」で `プロファイルを指定` を選び、インポートしたプロファイルを選択
1. `プロファイル` タブで対象プロファイルを選び、`デフォルト` をクリック
