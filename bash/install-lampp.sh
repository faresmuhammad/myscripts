#!/bin/bash

sudo dnf install httpd


sudo systemctl start httpd
sudo systemctl enable httpd