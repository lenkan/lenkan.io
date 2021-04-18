#!/bin/bash

HOST=${HOST:-lenkanio}
DEPLOYMENT_NAME=deployment_$(date --utc +%s)
DEPLOYMENT_DIR=/var/www/lenkan.io/$DEPLOYMENT_NAME

tar -czf - --directory www . | ssh $HOST "mkdir -p $DEPLOYMENT_DIR; tar -xzf - --directory $DEPLOYMENT_DIR"

echo "
server {
        listen 8080;
        listen [::]:8080;

        root $DEPLOYMENT_DIR;

        index index.html index.htm;

        server_name _;

        location / {
                try_files \$uri \$uri/ =404;
        }
}" | ssh $HOST "tee /etc/nginx/sites-available/default"

ssh -t $HOST "sudo nginx -s reload"
