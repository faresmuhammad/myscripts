#!/bin/bash

# Install the repository RPM:
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/F-38-x86_64/pgdg-fedora-repo-latest.noarch.rpm

# Install PostgreSQL:
sudo dnf install -y postgresql15-server

# Optionally initialize the database and enable automatic start:
sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
sudo systemctl enable postgresql-15
sudo systemctl start postgresql-15


echo "Change encryption method in pg_hba.conf in this path /var/lib/pgsql/15/data/pg_hba.conf from ident or the existing algorithm to md5, may be in line 87"
echo "Uncomment listen_addresses and port in postgresql.conf in the same path"

#Create Postgres User
#postgres user must be logged in
#sudo -i -u postgres
#or
#su - postgres

# echo "Enter User Name:"
# read user
# sudo -u postgres createuser $user