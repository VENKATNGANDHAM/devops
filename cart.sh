echo Setup NodeJS repos. Vendor is providing a script to setup the repos.
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo Setup SystemD Cart Service
cp cart.service /etc/systemd/system/cart.service
echo Install Nodejs
yum install nodejs -y
echo Add application user
useradd roboshop
mkdir /app
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip
echo Lets download the dependencies.
cd /app
npm install

echo Load the service.
systemctl daemon-reload
echo  start the service.
systemctl enable cart
systemctl restart cart