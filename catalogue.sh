sudo -i

##Setup NodeJS repos. Vendor is providing a script to setup the repos.
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
##Install NodeJS
yum install nodejs -y
##Add application User
useradd roboshop
mkdir /app
##Download the application code to created app directory.
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
##Lets download the dependencies.
cd /app
npm install
##Setup SystemD Catalogue Service
cp catalogueservices /etc/systemd/system/catalogue.service
##Load service
systemctl daemon-reload
##Start the service.
systemctl enable catalogue
systemctl restart catalogue

##We need to load the schema. To load schema we need to install mongodb client.
  #  #To have it installed we can setup MongoDB repo and install mongodb-client
  cp mongodbrepo /etc/yum.repos.d/mongo.repo

##Install mongodb
yum install mongodb-org-shell -y
##Load Schema
mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js