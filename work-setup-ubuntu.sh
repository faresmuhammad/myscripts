#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

echo "Installing neccessary packages for apache server..."
echo ""


read -p "Did you install XAMPP and set the configuration? " xampp
if [ $xampp == 'y' ]; then
    echo "Installing php extensions...";echo ""
    sudo gpt install php-cli unzip curl php-zip php-gd php-xml php-mongodb php-soap -y
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
    echo "done"
fi
# run composer command after installation to verify it's installed

# add other extension or edit the file after installation to add the unrecognized extensions

echo "Installing Some Essential Packages gh, glab, fzf"
sudo gpt install git gh glab fzf -y

read -p "Did you configure git, gh and glab?" git

if [ $git == 'y' ];then
    echo "Well Done!"
    echo "Next steps -> install warp terminal, postman, phpstorm, vscode, tableplus, dbeaver, AppImageLauncher, clickup, zoom, mailspring and configure bitwarden"
    echo ""
    echo "then -> copy bash aliases from faresmuhammad/myscripts repo"
fi