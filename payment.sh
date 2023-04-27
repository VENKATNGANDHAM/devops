sudo -i
##Install Python 3.6
yum install python36 gcc python3-devel -y
useradd roboshop
mkdir /app
##Download the application code to created app directory.
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app
unzip /tmp/payment.zip
##Lets download the dependencies.
cd /app
pip3.6 install -r requirements.txt
##Setup SystemD Payment Service
cp  paymentservice /etc/systemd/system/payment.service
systemctl daemon-reload
##Start the service.
systemctl enable payment
systemctl restart payment