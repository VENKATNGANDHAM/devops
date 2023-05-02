sudo -i
##--> Remove the default content that web server is serving.
rm -rf /usr/share/nginx/html/*
##--->copy config/Create Nginx Reverse Proxy Configuration.
echo creating nginx proxy configuration file
cp frontendconfig /etc/nginx/default.d/roboshop.conf
## -->>>Install Nginx
echo Installing nginx
yum install nginx -y
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
##--->Start & Enable Nginx service
systemctl enable nginx
systemctl restart nginx
echo restarted nginx services