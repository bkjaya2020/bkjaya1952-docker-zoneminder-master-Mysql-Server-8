add-apt-repository ppa:iconnor/zoneminder-master
apt -y install msmtp tzdata gnupg supervisor
apt -y install mysql-server
rm /etc/mysql/my.cnf  
cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/my.cnf
apt -y install zoneminder
/etc/init.d/mysql start
mysql -e "ALTER USER 'zmuser'@localhost IDENTIFIED BY 'zmpass';"
mysql -e "GRANT ALL PRIVILEGES ON zm.* TO 'zmuser'@'localhost' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES ;"
mysqladmin -uroot --password="" reload 2>/dev/null
mysql -u zmuser --password="" zm < /usr/share/zoneminder/db/zm_update-1.37.36.sql 2>/dev/null
