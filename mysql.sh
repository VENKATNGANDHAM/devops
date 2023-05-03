dnf module disable mysql -y
echo ##Setup the MySQL5.7 repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo
echo #Install MySQL Server
yum install mysql-community-server -y
echo  ##Start MySQL Service
systemctl enable mysqld
systemctl restart mysqld
mysql_secure_installation --set-root-pass RoboShop@1
echo ##check this after loggininto sql
mysql -uroot -pRoboShop@1