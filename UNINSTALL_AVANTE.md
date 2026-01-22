# avante.nvim アンインストール手順

このPRでは設定ファイルからavante.nvimの設定を削除しましたが、ローカルでavante.nvimをアンインストールする手順は以下の通りです。

## アンインストール手順

### 1. lazy.nvimのクリーンアップ

Neovimを起動して、以下のコマンドを実行します:

```vim
:Lazy clean
```

これにより、`init.lua`から削除されたプラグインがアンインストールされます。

### 2. 環境変数の削除

`.bashrc`ファイルから以下の環境変数を削除してください（このPRで既に削除されています）:

```bash
export GEMINI_API_KEY=""
export ANTHROPIC_API_KEY=""
```

削除後、bashrcを再読み込みします:

```bash
source ~/.bashrc
```

### 3. avante.nvimのデータディレクトリを削除（オプション）

avante.nvimが作成したデータファイルやキャッシュを完全に削除したい場合:

```bash
rm -rf ~/.local/share/nvim/lazy/avante.nvim
rm -rf ~/.local/state/nvim/avante
```

## 変更内容

このPRでは以下の変更を行いました:

1. **nvim/init.lua**から削除:
   - avante.nvimのキーマッピング (5行)
   - avante.nvimのプラグイン設定 (42行)

2. **.bashrc**から削除:
   - `GEMINI_API_KEY` 環境変数
   - `ANTHROPIC_API_KEY` 環境変数

## 理由

codex cliとgemini cliを導入したことにより、nvim内でAIエージェントとチャットをするユースケースがなくなったため、avante.nvimを削除しました。nvim内のAIとしてはcopilotで十分です。
