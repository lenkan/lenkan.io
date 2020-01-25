#!/bin/sh
if [ $# != 1 ] 
then 
  echo "Usage: $0 <output directory>"
  exit
fi

out_dir=$1

if [ ! -e "$out_dir/options-ssl-nginx.conf" ] || [ ! -e "$out_dir/ssl-dhparams.pem" ]; then
  mkdir -p "$out_dir"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf > "$out_dir/options-ssl-nginx.conf"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/certbot/ssl-dhparams.pem > "$out_dir/ssl-dhparams.pem"
  echo
fi
