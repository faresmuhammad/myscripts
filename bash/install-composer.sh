#!/bin/bash

curl -sS https://getcomposer.org/installer | php

sudo mv composer.phar /usr/local/bin/composer

sudo chmod +x /usr/local/bin/composer

echo ""
echo "run composer -V to check if composer installed successfully"
