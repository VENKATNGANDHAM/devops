echo #Install GoLang
yum install golang -y
echo ##Setup SystemD Payment Service
cp  dispatch.conf /etc/systemd/system/dispatch.service
useradd roboshop
mkdir /app
echo ##Download the application code to created app directory.
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app
unzip /tmp/dispatch.zip
echo ##Lets download the dependencies & build the software.
cd /app
go mod init dispatch
go get
go build

systemctl daemon-reload
echo  ##Start the service.
systemctl enable dispatch
systemctl restart dispatch