#!/bin/bash

#Reference: https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-red-hat?view=sql-server-ver16&tabs=rhel8

echo "Add MSSQL Server Repository"
echo ""
#sudo curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/8/mssql-server-2022.repo


echo "Installing MSSQL Server"
#sudo yum install -y mssql-server


echo "Setup Configuration"
#sudo /opt/mssql/bin/mssql-conf setup


