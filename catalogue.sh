echo Setup NodeJS repos. Vendor is providing a script to setup the repos.
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo Install NodeJS
yum install nodejs -y
##Add application User
useradd roboshop
mkdir /app
echo Download the application code to created app directory.
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
echo Lets download the dependencies...
cd /app
npm install
echo Setup SystemD Catalogue Service
cp catalogue.config /etc/systemd/system/catalogue.service
echo Load service
systemctl daemon-reload
echo Start the service.
systemctl enable catalogue
systemctl restart catalogue

##We need to load the schema. To load schema we need to install mongodb client.
  #  #To have it installed we can setup MongoDB repo and install mongodb-client
  cp mongodbrepo /etc/yum.repos.d/mongo.repo

echo Install mongodb
yum install mongodb-org-shell -y
echo Load Schema
mongo --host mongodb-dev.ngandham.online </app/schema/catalogue.js