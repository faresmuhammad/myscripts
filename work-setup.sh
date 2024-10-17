#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

read -p "Did you install XAMPP and set the configuration?" xampp
if [ $xampp == 'y' ]; then
    echo "Installing composer"
fi
# run composer command after installation to verify it's installed

# add other extension or edit the file after installation to add the unrecognized extensions
sudo dnf install php-zip php-gd php-xml -y

echo "Installing GitHub cli and GitLab cli..."
# install xampp
# install composer
# install php extensions [install on device and enable in php.ini] curl gd fileinfo intl exif mysqli openssl pdo_mysql mbstring zip xml soap mongodb sodium xsl
# install postman
# install warp terminal
# install gh glab
# install fzf