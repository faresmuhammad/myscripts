#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

sudo apt-add-repository ppa:ondrej/php
sudo apt-add-repository main
sudo apt-add-repository restricted
sudo apt-add-repository universe
sudo apt-add-repository multiverse

sudo apt-get install bat php8.1-cli unzip curl php8.1-zip php8.1-gd php8.1-xml php8.1-mongodb php8.1-soap -y

read -p "Did you install XAMPP and set the configuration? " xampp
if [ $xampp == 'y' ]; then
    echo "Installing php extensions...";echo ""
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
    composer -V
fi
# run composer command after installation to verify it's installed

# add other extension or edit the file after installation to add the unrecognized extensions

echo "Installing Some Essential Packages gh, fzf"
sudo apt install git gh glab fzf -y
echo ""

echo "Well Done!"
echo "Configure Bitwarden";echo "";
echo "Install Gitlab Cli -> https://about.gitlab.com/install/#ubuntu";echo "";
echo "Install Warp Terminal -> https://www.warp.dev/linux-terminal";echo "";
echo "Install Warp themes -> https://docs.warp.dev/appearance/custom-themes";echo "";
echo "Install Postman -> https://www.postman.com/downloads/";echo "";
echo "Install JetBrains ToolBox -> https://www.jetbrains.com/toolbox-app/";echo "";
echo "Install Table Plus -> https://tableplus.com/download";echo "";
echo "Next steps -> install warp terminal, postman, phpstorm, vscode, tableplus, dbeaver, AppImageLauncher, clickup, zoom, mailspring and configure bitwarden"
echo ""
echo "then -> copy bash aliases from faresmuhammad/myscripts repo"