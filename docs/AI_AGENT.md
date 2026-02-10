# AI Agent
AIエージェント関連の設定と運用をまとめる。<br>
AI Agentは端末によって使用可否が異なるため、インストール作業も含めてそれぞれの端末に適した設定を行う。<br>

## Codex
### 共有設定
`codex/config.global.toml`に記載する。<br>
共有設定を追加する場合は、`~/.codex/config.toml`に追記した後に`codex/config.global.toml`にも手動で反映してコミットする。

### 端末固有設定
`~/.codex/config.toml`に記載する。<br>
このファイルはCodexが自動で追記するケースがあるため、Git管理しない。

### 初期作成
`make codex-config`を実行すると、`~/.codex/config.toml`が存在しない場合のみ作成される。<br>
既に存在する場合は上書きせず、手動で編集する。

## Gemini
`gemini/settings.json`は端末固有情報がほぼないため、共有設定としてこのリポジトリで管理する。<br>
端末固有情報が増えた際には、設定情報の分割を実装する。
