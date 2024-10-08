#!/bin/bash
aurInstalled=0

function get {
	echo
	read -p "$1 (y/n) " -n 1 answer
	echo
 	echo
	if [ $answer = y ] || [ $answer = Y ]; then
		return 1
	elif [ "$answer" = "n" ] || [ $answer = N ]; then
		return 0
	else
		echo "Invalid input. Please enter 'y' or 'n'."
		get $1
	fi
}

get 'Start install(may take some minutes)?'
if [ $? = 0 ]; then
	exit
fi
get 'install yay(AUR)? (n: only when already installed)'
if [ $? = 1 ]; then
	sudo pacman -S --noconfirm --needed base-devel git	
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si --noconfirm
	cd ..
	sudo rm -r yay
fi
echo $aurInstalled
get 'Install basic configuration?(hyprland with waybar, hyprpaper, ... + config files)'
if [ $? = 1 ]; then
	sudo pacman -S --noconfirm hyprland waybar hyprpaper hyprlock alacritty neovim wl-clipboard wofi polkit-gnome grim cliphist slurp ttf-font-awesome ttf-firacode-nerd npm unzip
 	yay -S --noconfirm wlogout
	get 'copy config(recommended)?'
	if [ $? = 1 ]; then
		cp -r ./.config/alacritty ~/.config
		cp -r ./.config/hypr ~/.config
		cp -r ./.config/wlogout ~/.config
		cp -r ./.config/nvim ~/.config
		cp -r ./.config/waybar ~/.config
		cp -r ./.config/wofi ~/.config
  		yay -S --noconfirm dracula-gtk-theme
  		gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
		gsettings set org.gnome.desktop.wm.preferences theme "Dracula"

	fi
	get 'Install fish(better shell) + fastfetch(better neofetch)?'
	if [ $? = 1 ]; then
		sudo pacman -S --noconfirm fish
		chsh -s /usr/bin/fish
		yay -S --noconfirm fastfetch
		cp -r ./.config/fastfetch ~/.config
		cp -r ./.config/fish ~/.config
  		curl -sS https://starship.rs/install.sh | sh
    		cp ./.config/starship.toml ~/.config
	fi

	get 'Install ly(better greeter)?'
	if [ $? = 1 ]; then
		sudo pacman -S --noconfirm ly
		sudo systemctl enable ly.service
	fi
	get 'Install dunst(notifications)?'
	if [ $? = 1 ]; then
		sudo pacman -S --noconfirm dunst
		cp -r ./.config/dunst ~/.config
	fi
fi
get 'Install useful programs(manually decide)'
if [ $? = 1 ]; then
	get 'Install ranger(terminal file manager)?'
	if [ $? = 1 ]; then
		sudo pacman -S --noconfirm ranger
		cp -r ./.config/ranger ~/.config
	fi
	get 'Install librewolf(debloated firefox)?'
	if [ $? = 1 ]; then
		yay -S --noconfirm librewolf-bin
	fi
	get 'Install thunar(GUI fileManager)?'
	if [ $? = 1 ]; then
		sudo pacman -S --noconfirm thunar
	fi
	get 'Install thunderbird(Email client)?'
	if [ $? = 1 ]; then
		sudo pacman -S --noconfirm btop
	fi
	get 'Install ad-block spotify + cava(beautiful audio visualizer)?'
	if [ $? = 1 ]; then
		yay -S --noconfirm spotify-adblock cava-git
		cp -r ./.config/cava ~/.config
	fi
	get 'Install webcord(discord with screen sharing for wayland)?'
	if [ $? = 1 ]; then
		yay -S --noconfirm webcord
	fi
	get 'Install btop(hardware monitor)?'
	if [ $? = 1 ]; then
		sudo pacman -S --noconfirm btop
	fi
 	get 'Install pavucontrol(GUI for audio-input/output)?'
	if [ $? = 1 ]; then
		sudo pacman -S --noconfirm pavucontrol
	fi
fi
get 'reboot now'
if [ $? = 1 ]; then
	reboot
fi
