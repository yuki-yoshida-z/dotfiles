.PHONY: local-setup init brew-check codex-config

local-setup:
	@./scripts/local-setup.sh

init:
	@./scripts/init.sh

brew-check:
	@./scripts/brewfile-check.sh

codex-config:
	@./scripts/codex-config.sh
