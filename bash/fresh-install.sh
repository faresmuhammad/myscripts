#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi


echo "Installing Flatpak..."

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Done Flatpak"
echo "-------------------------------------------------------"

echo "Installing KeepassXC..."

flatpak install org.keepassxc.KeePassXC

echo "Done KeepassXC"
echo "-------------------------------------------------------"

echo "Installing OneDrive..."

sudo dnf install onedrive -y

echo "Done OneDrive"
echo "-------------------------------------------------------"

echo "Installing VSCode..."

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf install code -y

echo "Done VSCode"
echo "-------------------------------------------------------"

echo "Installing GitHub CLI..."
sudo dnf install gh -y
echo "Done GitHub CLI"
echo "-------------------------------------------------------"

echo "Installing Composer..."
sudo dnf install php-cli unzip curl -y

cd ~
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")
EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)

if [ "$EXPECTED_SIGNATURE" != "$SIGNATURE" ]
then
    echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php

echo "Done Composer"
echo "-------------------------------------------------------"

echo "Installing PHP Extensions: xml, mbstring, zip, gd, mysql"

sudo dnf install php-xml php-mbstring php-zip php-gd php-mysqlnd -y

echo "Done PHP Extensions"
echo "-------------------------------------------------------"

echo "Installing Telegram flatpak..."

flatpak install flathub org.telegram.desktop

echo "Done Telegram"

echo "-------------------------------------------------------"
echo "Tasks after installation"
echo "1) Authenticate OneDrive"
echo "2) Synchronize keepass database from onedrive"
echo "3) Configure gh"
echo "4) Configure git"
echo "5) Verify Composer by composer"
echo "6) Install XAMPP from https://www.apachefriends.org/"
echo "7) Install Mailspring from https://www.getmailspring.com/download"
