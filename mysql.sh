sudo -i
dnf module disable mysql -y
##Setup the MySQL5.7 repo file
cp mysqlrepo /etc/yum.repos.d/mysql.repo
#Install MySQL Server
yum install mysql-community-server -y
##Start MySQL Service
systemctl enable mysqld
systemctl restart mysqld
mysql_secure_installation --set-root-pass RoboShop@1
##check this after loggininto sql
mysql -uroot -pRoboShop@1