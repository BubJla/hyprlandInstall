if status is-interactive
	fastfetch -c ~/.config/fastfetch/presets/config.jsonc
	alias r 'ranger'
	alias l 'hyprctl dispatch dpms on && exit'
	alias v 'nvim'
	alias vim 'nvim'
	alias c 'clear'
	alias b 'bluetuith'
	alias s 'env LD_PRELOAD=/usr/lib/spotify-adblock.so spotify --uri=%U'
	alias discord 'webcord'
	alias waterfox 'flatpak run net.waterfox.waterfox'
	alias github 'flatpak run io.github.shiftey.Desktop'
	alias spotify 'env LD_PRELOAD=/usr/lib/spotify-adblock.so spotify --uri=%U'
	alias bluetooth 'bluetuith'
	alias update 'flatpak update && sudo pacman -Syu && yay -Syu'
	export EDITOR=nvim


    # Commands to run in interactive sessions can go here
end
set fish_greeting
set -gx PATH $PATH ~/.local/bin

