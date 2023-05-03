echo ##Install Python 3.6
yum install python36 gcc python3-devel -y
echo ##Setup SystemD Payment Service
cp  payment.conf /etc/systemd/system/payment.service
useradd roboshop
mkdir /app
echo ##Download the application code to created app directory.
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app
unzip /tmp/payment.zip
echo ##Lets download the dependencies.
cd /app
pip3.6 install -r requirements.txt

systemctl daemon-reload
echo ##Start the service.
systemctl enable payment
systemctl restart payment