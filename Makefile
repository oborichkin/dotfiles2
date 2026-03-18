all: tpm
	stow nvim tmux -t $$HOME

tpm: ~/.config/tmux/plugins/tpm
~/.config/tmux/plugins/tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
