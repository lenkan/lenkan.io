#!/bin/bash
if [ $# != 1 ] 
then 
  echo "Usage: $0 <output directory>"
  exit
fi

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
out_dir=$1
cert_file=$out_dir/fullchain.pem
key_file=$out_dir/privkey.pem
nginx_conf_file=$out_dir/options-ssl-nginx.conf
ssh_params_file=$out_dir/ssl-dhparams.pem

if [ ! -d $out_dir ]; then
  mkdir $out_dir
  echo
fi

if [ ! -e "$cert_file" ] || [ ! -e "$key_file" ]; then
  openssl req -x509 -out $cert_file -keyout $key_file \
    -newkey rsa:2048 -nodes -sha256 \
    -subj '/CN=localhost' -extensions EXT -config $script_dir/openssl.conf \
    -outform PEM
  echo
fi

if [ ! -e "$nginx_conf_file" ] || [ ! -e "$ssh_params_file" ]; then
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf > "$nginx_conf_file"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/certbot/ssl-dhparams.pem > "$ssh_params_file"
  echo
fi
