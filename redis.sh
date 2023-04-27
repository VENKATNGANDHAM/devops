sudo-i
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
dnf module enable redis:remi-6.2 -y
##Install Redis
yum install redis -y

##Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/redis.conf & /etc/redis/redis.conf
##Start & Enable Redis Service
systemctl enable redis
systemctl restart redis