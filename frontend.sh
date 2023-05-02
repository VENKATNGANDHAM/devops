## -->>>Install Nginx
echo Installing nginx
yum install nginx -y
systemctl enable nginx
systemctl start nginx
echo started nginx
sleep 10
tail -f /var/log/nginx/error.log
cd /home/centos/devops
##--> Remove the default content that web server is serving.
rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
##--->copy config/Create Nginx Reverse Proxy Configuration.
echo creating nginx proxy configuration file
cp frontendconfig /etc/nginx/default.d/roboshop.conf
##--->Start & Enable Nginx service
systemctl enable nginx
systemctl restart nginx
echo restarted nginx services
