sudo -i
##Setup NodeJS repos. Vendor is providing a script to setup the repos.
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
##Install NodeJS
yum install nodejs -y
##Add application User
useradd roboshop
##Lets setup an app directory.
mkdir /app
##Download the application code to created app directory.
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
##Lets download the dependencies.
cd /app
npm install
##Setup SystemD User Service
cp userservice /etc/systemd/system/user.service
##Load the service.
systemctl daemon-reload
##Start the service.
systemctl enable user
systemctl restart user

##We need to load the schema. To load schema we need to install mongodb client.
  #
  #To have it installed we can setup MongoDB repo and install mongodb-client
  cp mongodbrepo /etc/yum.repos.d/mongo.repo
  yum install mongodb-org-shell -y
  ##Load Schema

  mongo --host MONGODB-SERVER-IPADDRESS </app/schema/user.js