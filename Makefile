.PHONY: local-setup init

DOTFILES_DIR := $(HOME)/dotfiles
GITCONFIG_LOCAL := $(HOME)/.gitconfig.local

local-setup:
	@if [ -f $(GITCONFIG_LOCAL) ]; then \
		echo "$(GITCONFIG_LOCAL) already exists. Skipping creation."; \
	else \
		cp .gitconfig.local.example $(GITCONFIG_LOCAL); \
		echo "Created $(GITCONFIG_LOCAL) from .gitconfig.local.example"; \
		echo ""; \
		echo "Please edit $(GITCONFIG_LOCAL) and set your name and email:"; \
		echo "  - user.name"; \
		echo "  - user.email"; \
		echo ""; \
		echo "After editing, run: make init"; \
	fi

init:
	@if [ ! -f $(GITCONFIG_LOCAL) ]; then \
		echo "Error: $(GITCONFIG_LOCAL) does not exist."; \
		echo "Please run 'make local-setup' first."; \
		exit 1; \
	fi
	@USER_NAME=$$(git config --file $(GITCONFIG_LOCAL) user.name); \
	USER_EMAIL=$$(git config --file $(GITCONFIG_LOCAL) user.email); \
	if [ -z "$$USER_NAME" ] || [ -z "$$USER_EMAIL" ]; then \
		echo "Error: user.name or user.email is not set in $(GITCONFIG_LOCAL)"; \
		echo "Please edit $(GITCONFIG_LOCAL) and set:"; \
		echo "  - user.name"; \
		echo "  - user.email"; \
		exit 1; \
	fi
	@echo "Setting up dotfiles..."
	ln -sf $(DOTFILES_DIR)/.vimrc $(HOME)/.vimrc
	ln -sf $(DOTFILES_DIR)/.bash_profile $(HOME)/.bash_profile
	ln -sf $(DOTFILES_DIR)/.bashrc $(HOME)/.bashrc
	ln -sf $(DOTFILES_DIR)/.fzf.bash $(HOME)/.fzf.bash
	ln -sf $(DOTFILES_DIR)/.gitconfig $(HOME)/.gitconfig
	mkdir -p $(HOME)/.config
	ln -sf $(DOTFILES_DIR)/nvim $(HOME)/.config/nvim
	mkdir -p $(HOME)/.gemini
	ln -sf $(DOTFILES_DIR)/gemini/settings.json $(HOME)/.gemini/settings.json
	mkdir -p $(HOME)/.codex
	ln -sf $(DOTFILES_DIR)/codex/config.toml $(HOME)/.codex/config.toml
	@echo "Dotfiles setup complete!"
