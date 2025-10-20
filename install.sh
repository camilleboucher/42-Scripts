USER=$(whoami)

echo "
░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░        ░▒▓███████▓▒░░▒▓██████▓▒░░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░▒▓████████▓▒░▒▓███████▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░  ░▒▓█▓▒░        
░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░  ░▒▓█▓▒░        
░▒▓████████▓▒░░▒▓██████▓▒░        ░▒▓██████▓▒░░▒▓█▓▒░      ░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░  ░▒▓█▓▒░   ░▒▓██████▓▒░  
       ░▒▓█▓▒░▒▓█▓▒░                    ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░         ░▒▓█▓▒░ 
       ░▒▓█▓▒░▒▓█▓▒░                    ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░         ░▒▓█▓▒░ 
       ░▒▓█▓▒░▒▓████████▓▒░      ░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░  ░▒▓███████▓▒░  
Welcome to the installation script, $USER!
This script will help you install automation scripts for your 42 school session.
"

install_flatpak_update() {
    mkdir -p /home/$USER/.config/autostart/scripts

    cat << EOF > /home/$USER/.config/autostart/scripts/update-flatpaks.sh
#!/bin/bash
flatpak update -y
notify-send "Flatpak Updates" "The Flatpak updates have been completed."
EOF

    chmod +x /home/$USER/.config/autostart/scripts/update-flatpaks.sh

    cat << EOF > /home/$USER/.config/autostart/update-flatpaks.desktop
[Desktop Entry]
Type=Application
Exec="/home/$USER/.config/autostart/scripts/update-flatpaks.sh"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Flatpak Update
Comment=Automatic Flatpak updates at startup
EOF

    echo "The script and launcher have been installed successfully.  Have a great day! 🌟"
}

read -p "Do you want to install the Flatpak update script? (y/n) " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    install_flatpak_update
else
    echo "Installation canceled. Have a great day! 🌟"
fi
