all: tpm
	stow i3 nvim scripts sxhkd tmux x zsh -t $$HOME

tpm: ~/.config/tmux/plugins/tpm
~/.config/tmux/plugins/tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

install-nvim:
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
	sudo mv /opt/nvim-linux-x86_64 /opt/nvim
	sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

deps:
	sudo apt install -y --no-install-recommends \
		zsh \
		alacritty \
		zathura \
		dex \
		dunst \
		nitrogen \
		i3 \
		tmux \
		sxhkd \
		suckless-tools \
		scrot \
		maim \
		xdotool
