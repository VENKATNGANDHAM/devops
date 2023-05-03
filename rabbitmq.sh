echo ##Configure YUM Repos from the script provided by vendor.
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
echo #Install ErLang
yum install erlang -y
echo #Configure YUM Repos for RabbitMQ.
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
echo #Install RabbitMQ
yum install rabbitmq-server -y
echo ##Start RabbitMQ Service
systemctl enable rabbitmq-server
systemctl restart rabbitmq-server
echo  ##RabbitMQ comes with a default username / password as guest/guest. But this user cannot be used to connect.
echo # Hence, we need to create one user for the application.
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"