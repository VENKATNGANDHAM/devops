yum install maven -y
cp shipping.service /etc/systemd/system/shipping.service
useradd roboshop
mkdir /app
echo ##Download the application code to created app directory.
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip
echo ##Lets download the dependencies & build the application
cd /app
mvn clean package
mv target/shipping-1.0.jar shipping.jar
echo ##create shipping services
echo ##Load the service.
systemctl daemon-reload
echo  ##Start the service.
systemctl enable shipping
systemctl restart shipping
echo  ##To have it installed we can use
yum install mysql -y
echo  ##Load Schema
mysql -h mysql-dev.ngandham.online -uroot -pRoboShop@1 < /app/schema/shipping.sql

echo ##retstart shipping
systemctl restart shipping