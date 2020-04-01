#!/bin/bash

# Getting PRIVATE IP of container
PRIVATE_IP_ADDRESS=$(dig $HOSTNAME +short)

# Setting tag for every service, with help of this tag we will have URL per server
sed -i 's/application/'"$HOSTNAME"'/g' /etc/consul.d/web.json

# Starting Nginx
echo $PRIVATE_IP_ADDRESS > /usr/share/nginx/html/index.html
/usr/sbin/nginx -c /etc/nginx/nginx.conf

# Starting Consul Client Agent
consul agent -bind $PRIVATE_IP_ADDRESS \
    -advertise $PRIVATE_IP_ADDRESS \
    -join consul-server-1 \
    -node $HOSTNAME \
    -dns-port 53 \
    -data-dir /data \
    -config-dir /etc/consul.d \
    -enable-local-script-checks