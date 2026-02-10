# 運用
日々の運用・変更時の手順をまとめる。

## bash設定の運用
変更の反映は共通で次のいずれか。
1. 新しいタブ/ウィンドウを開く
1. 現在のシェルで `source ~/.bashrc` を実行
`bashrc.d`配下は共有設定、`~/.bashrc.local`は端末固有設定として使う。
`bashrc.d`配下は自由にファイルを追加してよい。
注意点として、`bashrc.d`のファイル名プレフィックスの数字は読み込み順を意味し、数字が小さいほど先に読み込まれる。

## gitconfigの運用
`~/.gitconfig`は共有設定、`~/.gitconfig.local`は端末固有設定として使う。
変更はGitコマンド実行時に読み込まれるため、編集後は次のGitコマンドから即反映される。

## Brewfileの運用
`Brewfile`は共有設定、`~/.Brewfile.local`は端末固有設定として使う。

### パッケージのインストール手順
`brew install`/`brew tap`はラッパー関数でフックしており、インストールしたパッケージやtapは`~/.Brewfile.local`に追記される。
共有設定としてパッケージを入れる場合は、`Brewfile`に追記して`brew bundle --file ~/dotfiles/Brewfile`を実行する。
または、`brew install`して`~/.Brewfile.local`へ追記されたパッケージを`Brewfile`へ移動してもok。

### パッケージのアンインストール手順
`brew uninstall`を実行した後に`Brewfile`または`~/.Brewfile.local`から該当エントリを削除すること。
`brewfile`/`brewfile.local`と実際のインストール状況の整合性は担保されていない。
整合性チェックは`make brew-check`で実行できる。
