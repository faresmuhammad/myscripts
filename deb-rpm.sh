#!/bin/bash

sudo dnf install alien

echo $package
sudo alien -r -i $package
