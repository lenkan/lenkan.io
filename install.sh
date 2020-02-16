#!/bin/sh
mkdir -p /var/www/lenkan.io && cp -r www/** /var/www/lenkan.io
cp -r nginx/** /etc/nginx/conf.d
