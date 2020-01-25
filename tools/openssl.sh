#!/bin/sh
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ $# != 1 ] 
then 
  echo "Usage: $0 <output directory>"
  exit
fi

out_dir=$1

openssl req -x509 -out $out_dir/fullchain.pem -keyout $out_dir/privkey.pem \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=localhost' -extensions EXT -config $script_dir/openssl.conf \
  -outform PEM
