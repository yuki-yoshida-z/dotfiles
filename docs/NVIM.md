# Neovim
Neovimのセットアップ手順をまとめる。

## 初回起動
`~/.config/nvim`が本リポジトリの`nvim`にリンクされている状態で`nvim`を起動すると、`lazy.nvim`のブートストラップが走り、その後プラグインがインストールされる。

## Copilot
Neovim上で`:Copilot setup`を実行し、GitHub認証を行う。

## LSP
LSPは言語サーバーを別途インストールする必要がある。
RubyやNode.js自体のインストールが前提になる。
導入する言語サーバーは`nvim/init.lua`の設定に従う。

### 言語サーバーのインストール手順
前提: Ruby/Node.js/Goはインストール済み。

1. Ruby（solargraph）
```
gem install solargraph
```

2. Node.js（TypeScript/HTML/CSS）
```
npm install -g typescript typescript-language-server
npm install -g vscode-langservers-extracted
```

3. Go（gopls）
```
go install golang.org/x/tools/gopls@latest
```

4. Terraform（terraformls）
```
brew install terraform-ls
```
