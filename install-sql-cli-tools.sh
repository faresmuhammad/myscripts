#!/bin/bash
echo "Run $(sudo su) first then run this command $(curl https://packages.microsoft.com/config/rhel/8/prod.repo >/etc/yum.repos.d/mssql-release.repo)"

read -r -p "Are you ready for installing mssql-tools? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then

    echo "Installing SQL Server command-line tools"

    sudo yum remove mssql-tools unixODBC-utf16 unixODBC-utf16-devel

    sudo yum install -y mssql-tools18 unixODBC-devel
else
    exit 0
fi
