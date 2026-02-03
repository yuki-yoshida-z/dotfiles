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
1. tree-sitterのインストール
1. tree-sitter-cliのインストール
1. pip install pylatexenc
1. neovimのインストール
1. codex cliのインストール
1. gemini cliのインストール
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

#### codex cliのインストール
```
brew install codex
```
※2026年1月現在の方法です。実際の手順はcodex公式を確認してください。

#### gemini cliのインストール
```
brew install gemini-cli
```
※2026年1月現在の方法です。実際の手順はgemini公式を確認してください。

## Dotfilesの適用
上記のパッケージをインストール後に以下を実装
```
sh dotfiles.sh
```

## .localファイルの運用（個人/端末固有の設定）
このリポジトリは公開用テンプレを維持し、個人情報や端末固有の設定は`*.local`に分離して管理する。`*.local`はGit管理外で、存在する場合のみ反映される。

### 対象となる`.local`ファイル
- `~/.bash_profile.local`（`.bash_profile`から読み込まれる）
- `~/.bashrc.local`（`.bashrc`から読み込まれる）
- `~/.gitconfig.local`（`.gitconfig`から`include`で読み込まれる）
- `~/.codex/config.toml`（`codex/config.toml` + `codex/config.toml.local`を結合）
- `~/.gemini/settings.json`（`gemini/settings.json` + `gemini/settings.json.local`を結合）
- `~/.claude/settings.json`（`claude/settings.json` + `claude/settings.json.local`を結合）

### 設定手順
1. 必要に応じて、以下の`.local`ファイルを作成する（例）。
   - `~/dotfiles/.bash_profile.local`
   - `~/dotfiles/.bashrc.local`
   - `~/dotfiles/.gitconfig.local`
   - `~/dotfiles/codex/config.toml.local`
   - `~/dotfiles/gemini/settings.json.local`
   - `~/dotfiles/claude/settings.json.local`
2. `sh dotfiles.sh` を実行する。  
   - `.local`が存在する場合のみ、シンボリックリンクまたは結合ファイルが生成される。
   - 端末ごとに不要なツールがある場合は `.local` を置かなければ何もしない。

### 例: Gitのユーザー情報を`.gitconfig.local`へ
```
[user]
  name = YOUR_NAME
  email = YOUR_EMAIL
```
