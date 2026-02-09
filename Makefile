.PHONY: local-setup init

DOTFILES_DIR := $(HOME)/dotfiles
GITCONFIG_LOCAL := $(HOME)/.gitconfig.local
GITCONFIG_LOCAL_SRC := $(DOTFILES_DIR)/.gitconfig.local
BASHRC_LOCAL := $(HOME)/.bashrc.local
BASHRC_LOCAL_SRC := $(DOTFILES_DIR)/.bashrc.local
BREWFILE_LOCAL := $(DOTFILES_DIR)/.Brewfile.local

local-setup:
	@if [ -f $(GITCONFIG_LOCAL_SRC) ]; then \
		echo "$(GITCONFIG_LOCAL_SRC) already exists. Skipping creation."; \
	else \
		cp .gitconfig.local.example $(GITCONFIG_LOCAL_SRC); \
		echo "Created $(GITCONFIG_LOCAL_SRC) from .gitconfig.local.example"; \
		echo ""; \
		echo "Please edit $(GITCONFIG_LOCAL_SRC) and set your name and email:"; \
		echo "  - user.name"; \
		echo "  - user.email"; \
		echo ""; \
		echo "After editing, run: make init"; \
	fi
	@if [ -f $(BASHRC_LOCAL_SRC) ]; then \
		echo "$(BASHRC_LOCAL_SRC) already exists. Skipping creation."; \
	else \
		cp bashrc.local.example $(BASHRC_LOCAL_SRC); \
		echo "Created $(BASHRC_LOCAL_SRC) from bashrc.local.example"; \
	fi
	@if [ -f $(BREWFILE_LOCAL) ]; then \
		echo "$(BREWFILE_LOCAL) already exists. Skipping creation."; \
	else \
		printf "# Local-only Homebrew packages\n" > $(BREWFILE_LOCAL); \
		echo "Created $(BREWFILE_LOCAL)"; \
	fi

init:
	@if [ ! -f $(GITCONFIG_LOCAL_SRC) ]; then \
		echo "Error: $(GITCONFIG_LOCAL_SRC) does not exist."; \
		echo "Please run 'make local-setup' first."; \
		exit 1; \
	fi
	@USER_NAME=$$(git config --file $(GITCONFIG_LOCAL_SRC) user.name); \
	USER_EMAIL=$$(git config --file $(GITCONFIG_LOCAL_SRC) user.email); \
	if [ -z "$$USER_NAME" ] || [ -z "$$USER_EMAIL" ]; then \
		echo "Error: user.name or user.email is not set in $(GITCONFIG_LOCAL_SRC)"; \
		echo "Please edit $(GITCONFIG_LOCAL_SRC) and set:"; \
		echo "  - user.name"; \
		echo "  - user.email"; \
		exit 1; \
	fi
	@echo "Setting up dotfiles..."
	ln -sf $(DOTFILES_DIR)/.bash_profile $(HOME)/.bash_profile
	ln -sf $(DOTFILES_DIR)/.bashrc $(HOME)/.bashrc
	@if [ -d $(HOME)/.bashrc.d ] && [ ! -L $(HOME)/.bashrc.d ]; then \
		mv $(HOME)/.bashrc.d $(HOME)/.bashrc.d.bak; \
		echo "Moved existing $(HOME)/.bashrc.d to $(HOME)/.bashrc.d.bak"; \
	fi
	ln -sfn $(DOTFILES_DIR)/bashrc.d $(HOME)/.bashrc.d
	ln -sf $(DOTFILES_DIR)/.fzf.bash $(HOME)/.fzf.bash
	ln -sf $(DOTFILES_DIR)/.gitconfig $(HOME)/.gitconfig
	ln -sf $(GITCONFIG_LOCAL_SRC) $(GITCONFIG_LOCAL)
	# ln -sf $(DOTFILES_DIR)/.vimrc $(HOME)/.vimrc
	# mkdir -p $(HOME)/.config
	# ln -sf $(DOTFILES_DIR)/nvim $(HOME)/.config/nvim
	# mkdir -p $(HOME)/.gemini
	# ln -sf $(DOTFILES_DIR)/gemini/settings.json $(HOME)/.gemini/settings.json
	# mkdir -p $(HOME)/.codex
	# ln -sf $(DOTFILES_DIR)/codex/config.toml $(HOME)/.codex/config.toml
	@echo "Dotfiles setup complete!"
