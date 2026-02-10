# AI Agent
AIエージェント関連の設定と運用をまとめる。

## Codex
### 共有設定
`codex/config.global.toml`に記載する。

### 端末固有設定
`~/.codex/config.toml`に記載する。
このファイルはCodexが自動で追記するケースがあるため、Git管理しない。

### 初期作成
`make codex-config`を実行すると、`~/.codex/config.toml`が存在しない場合のみ作成される。
既に存在する場合は上書きせず、手動で編集する。
