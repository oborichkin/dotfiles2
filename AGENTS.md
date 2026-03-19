# AGENTS.md

This file provides guidance to agents when working with code in this repository.

## Project Type
Linux dotfiles managed by GNU Stow. Configurations live in `*/.config/` subdirectories.

## Commands
- `make` or `make all` - Install all dotfiles (requires tpm first)
- `make tpm` - Clone tmux plugin manager to `~/.config/tmux/plugins/tpm`
- `stow <dir>` - Manually stow a specific component (e.g., `stow nvim -t $HOME`)

## Key Conventions
- tmux prefix: Ctrl+a (not Ctrl+b)
- tmux pane split: `\` for horizontal, `-` for vertical
- i3 modifier: Mod4 (Super/Windows key)
- Font requirement: BigBlueTermPlus Nerd Font (16pt for i3, 18pt for rofi)
- sxhkd reload: `pkill -USR1 -x sxhkd & i3-msg reload`

## Custom Scripts (installed to ~/.local/bin/)
- `launcher` - Rofi drun menu
- `workon` - Project launcher (scans $HOME/work/src, $HOME/dox/github)
- `powermenu` - System power menu (rofi-based)
- `screenshot` / `screenshot region` - Screenshot utilities
