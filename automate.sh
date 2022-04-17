
sudo dnf module reset php -y
sudo dnf module enable php:7.4 -y
sudo dnf install httpd php php-mysqlnd php-gd php-xml mariadb-server mariadb php-mbstring php-json mod_ssl php-intl php-apcu -y 
sudo systemctl start mariadb

sudo mysql_secure_installation <<EOF

y
redhat
redhat
y
y
y
y
EOF
sudo mysql -u root --password=secret -e "CREATE USER 'wiki'@'localhost' IDENTIFIED BY 'THISpasswordSHOULDbeCHANGED';"
sudo mysql -u root --password=secret -e "CREATE DATABASE wikidatabase;"  
sudo mysql -u root --password=secret -e "GRANT ALL PRIVILEGES ON wikidatabase.* TO 'wiki'@'localhost';"
sudo mysql -u root --password=secret -e "FLUSH PRIVILEGES;"
sudo mysql -u root --password=secret -e "GRANT ALL PRIVILEGES ON wikidatabase.* TO 'wiki'@'localhost';"
sudo systemctl enable mariadb
sudo systemctl enable httpd
cd /home
sudo wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.2.tar.gz
cd /var/www
sudo tar -zxf /home/username/mediawiki-1.37.2.tar.gz
sudo ln -s mediawiki-1.37.2/ mediawiki
sudo cp /tmp/apache-config.conf /etc/httpd/conf/httpd.conf
sudo chown -R apache:apache /var/www/mediawiki-1.37.2
sudo systemctl restart httpd
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo systemctl restart firewalld
sudo getenforce
sudo restorecon -FR /var/www/mediawiki-1.37.2
sudo restorecon -FR /var/www/mediawiki
