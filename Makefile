.PHONY: local-setup init brew-check

local-setup:
	@./scripts/local-setup.sh

init:
	@./scripts/init.sh

brew-check:
	@./scripts/brewfile-check.sh
