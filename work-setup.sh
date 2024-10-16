#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

# install xampp
# install composer
# install php extensions curl gd mbstring zip xml soap mongodb
# install postman