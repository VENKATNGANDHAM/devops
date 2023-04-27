sudo -i
##Setup NodeJS repos. Vendor is providing a script to setup the repos.
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
##Install Nodejs
yum install nodejs -y
##Add application user
useradd roboshop
mkdir /app
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip
##Lets download the dependencies.
cd /app
npm install
##Setup SystemD Cart Service
cp cartservice /etc/systemd/system/cart.service
##Load the service.
systemctl daemon-reload
##Start the service.
systemctl enable cart
systemctl restart cart