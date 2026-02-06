.PHONY: local-setup init

local-setup:
	@if [ -f ~/.gitconfig.local ]; then \
		echo "~/.gitconfig.local already exists. Skipping creation."; \
	else \
		cp .gitconfig.local.example ~/.gitconfig.local; \
		echo "Created ~/.gitconfig.local from .gitconfig.local.example"; \
		echo ""; \
		echo "Please edit ~/.gitconfig.local and set your name and email:"; \
		echo "  - user.name"; \
		echo "  - user.email"; \
		echo ""; \
		echo "After editing, run: make init"; \
	fi

init:
	@if [ ! -f ~/.gitconfig.local ]; then \
		echo "Error: ~/.gitconfig.local does not exist."; \
		echo "Please run 'make local-setup' first."; \
		exit 1; \
	fi
	@USER_NAME=$$(git config --file ~/.gitconfig.local user.name); \
	USER_EMAIL=$$(git config --file ~/.gitconfig.local user.email); \
	if [ -z "$$USER_NAME" ] || [ -z "$$USER_EMAIL" ]; then \
		echo "Error: user.name or user.email is not set in ~/.gitconfig.local"; \
		echo "Please edit ~/.gitconfig.local and set:"; \
		echo "  - user.name"; \
		echo "  - user.email"; \
		exit 1; \
	fi
	@echo "Setting up dotfiles..."
	ln -sf ~/dotfiles/.vimrc ~/.vimrc
	ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
	ln -sf ~/dotfiles/.bashrc ~/.bashrc
	ln -sf ~/dotfiles/.fzf.bash ~/.fzf.bash
	ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
	mkdir -p ~/.config
	ln -sf ~/dotfiles/nvim ~/.config/nvim
	mkdir -p ~/.gemini
	ln -sf ~/dotfiles/gemini/settings.json ~/.gemini/settings.json
	mkdir -p ~/.codex
	ln -sf ~/dotfiles/codex/config.toml ~/.codex/config.toml
	@echo "Dotfiles setup complete!"
