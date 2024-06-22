#!/bin/bash
aurInstalled=0

function get {
	read -p "$1 (y/n) " -n 1 answer
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

get 'Start install?'
if [ $? = 0 ]; then
	exit
fi
get 'install yay(AUR)?'
if [ $? = 1 ]; then
	sudo pacman -S --noconfirm --needed base-devel git	
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si --noconfirm
	cd ..
	sudo rm -r yay
else 
	echo 'yay has to be installed => exit'
	exit
fi
echo $aurInstalled
get 'Install basic configuration?(hyprland with waybar, hyprpaper, ... + config files)'
if [ $? = 1 ]; then
	sudo pacman -S --noconfirm hyprland waybar hyprpaper alacritty neovim ranger wl-clipboard wofi polkit-gnome grim cliphist slurp
	get 'copy config files(recommended)?'
	if [ $? = 1 ]; then
		cp -r ./.config/alacritty ~/.config
		cp -r ./.config/fish ~/.config
		cp -r ./.config/gtk-2.0 ~/.config
		cp -r ./.config/gtk-3.0 ~/.config
		cp -r ./.config/hypr ~/.config
		cp -r ./.config/nvim ~/.config
		cp -r ./.config/ranger ~/.config
		cp -r ./.config/waybar ~/.config
		cp -r ./.config/wofi ~/.config
	fi
	get 'Install fish(better shell) + fastfetch(better neofetch)?'
	if [ $? = 1 ]; then
		sudo pacman -S --noconfirm fish
		chsh -s /usr/bin/fish
		yay -S --noconfirm fastfetch
		cp -r ./.config/fastfetch ~/.config
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
	get 'Install waterfox(debloated firefox)?'
	if [ $? = 1 ]; then
		get 'Install flatpak(recommended)?'
		if [ $? = 1 ]; then
			sudo pacman -S --noconfirm flatpak
			flatpak install --noninteractive flathub io.gitlab.librewolf-community
		else 
			yay -S --noconfirm librewolf
		fi
	fi
	get 'Install dolphin(GUI fileManager)?'
	if [ $? = 1 ]; then
		sudo pacman -S --noconfirm dolphin
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
