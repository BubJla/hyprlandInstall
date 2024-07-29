# HyprlandInstall
 ---basic install script for hyprland with clean UI---

Great base for your own hyprland configuration


 
(only arch linux)

----------------------------------------------------------

Installation:

Dependency: git (sudo pacman -S git)
 
1.Download: git clone https://github.com/BubJla/hyprlandInstall.git
 
2.Go into the directory: cd hyprlandInstall

3.Make the file executable: chmod +x ./systemStart.sh
 
4.Start installation: ./systemStart.sh

or
  
Download zip and execute systemStart.sh in the terminal



-----------------------------------------------------------

Screenshots:




 Complete Desktop:

![image](https://github.com/user-attachments/assets/908c4b81-ba52-46f3-82f9-e7e60180fcd0)


![image](https://github.com/user-attachments/assets/4b051174-631e-48f2-99d7-deeed7fca73a)





Waybar:

![image](https://github.com/user-attachments/assets/2ad88d0c-2c6f-42c5-a3c5-52701e28995c)





Nvim:

![image](https://github.com/BubJla/hyprlandInstall/assets/123741924/897817d1-2f0a-4dad-bdac-21d94f249297)




Alacritty:

![image](https://github.com/user-attachments/assets/db307813-f991-4ed3-b0b5-57e6a10db2e8)





Wofi (drun):

![image](https://github.com/BubJla/hyprlandInstall/assets/123741924/4bd0edd7-bd7d-45e2-ab21-66e80fe7ce5e)




Fastfetch:

![image](https://github.com/BubJla/hyprlandInstall/assets/123741924/730a42dc-48ba-4a23-b095-3e3088c47077)





Ranger:

![image](https://github.com/BubJla/hyprlandInstall/assets/123741924/de18f67f-05cd-447a-a9a9-ea9eb63d60cb)





Cava + dunst(top right):

![image](https://github.com/BubJla/hyprlandInstall/assets/123741924/7b81e0d3-e5a7-4f17-9c04-bc7264f1777a)


wlogout:

![image](https://github.com/BubJla/hyprlandInstall/assets/123741924/27ec76e8-4134-41c0-bcd9-8e19aae83e97)






guide for hibernation: https://rusty-electron.github.io/blog/setting-up-hibernation-in-arch-linux.html

for btrfs: use sudo btrfs filesystem mkswapfile --size <SIZE>g --uuid clear /swapfile/path

Timeshift:

https://wiki.archlinux.org/title/Timeshift

for better looking pacman and yay: 
 add:
 
  ILoveCandy
  
  Color
  
 (in /etc/pacman.conf  under [options])


Inspired by: https://gitlab.com/stephan-raabe
