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

sudo dnf install onedrive

echo "Done OneDrive"
echo "-------------------------------------------------------"

echo "Installing VSCode..."

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf install code

echo "Done VSCode"
echo "-------------------------------------------------------"

echo "Installing GitHub CLI..."
sudo dnf install gh
echo "Done GitHub CLI"
echo "-------------------------------------------------------"

echo "Installing Composer..."
sudo dnf install php-cli unzip curl -y

cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php

HASH=`curl -sS https://composer.github.io/installer.sig`

php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

echo "Done Composer"
echo "-------------------------------------------------------"


echo "-------------------------------------------------------"
echo "Tasks after installation"
echo "1) Authenticate OneDrive"
echo "2) Synchronize keepass database from onedrive"
echo "3) Configure gh"
echo "4) Verify Composer by composer"
echo "x) Install XAMPP from https://www.apachefriends.org/