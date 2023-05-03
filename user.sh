echo Setup NodeJS repos. Vendor is providing a script to setup the repos.
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echoInstall NodeJS
yum install nodejs -y
echo Setup SystemD User Service
cp userservice.repo /etc/systemd/system/user.service
echo Add application User
useradd roboshop
echo Lets setup an app directory.
mkdir /app
echo Download the application code to created app directory.
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
echo Lets download the dependencies.
cd /app
npm install

echo Load the service.
systemctl daemon-reload
##Start the service.
systemctl enable user
systemctl restart user

##We need to load the schema. To load schema we need to install mongodb client.
  #
  #To have it installed we can setup MongoDB repo and install mongodb-client
  cp mongodb.repo /etc/yum.repos.d/mongo.repo
  yum install mongodb-org-shell -y
 echo Load Schema

  mongo --mongodb-dev.ngandham.online </app/schema/user.js