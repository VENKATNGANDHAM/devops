sudo -i
yum install maven -y
useradd roboshop
mkdir /app
##Download the application code to created app directory.
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip
##Lets download the dependencies & build the application
cd /app
mvn clean package
mv target/shipping-1.0.jar shipping.jar
##create shipping services
cp shippingservice /etc/systemd/system/shipping.service
##Load the service.
systemctl daemon-reload
##Start the service.
systemctl enable shipping
systemctl restart shipping
##To have it installed we can use
yum install mysql -y
##Load Schema
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/schema/shipping.sql

##retstart shipping
systemctl restart shipping