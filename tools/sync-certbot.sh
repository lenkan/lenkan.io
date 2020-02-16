#!/bin/bash
if [ $# != 1 ] 
then 
  echo "Usage: $0 <output directory>"
  exit
fi

out_dir=$1
ln -sf /etc/letsencrypt/live/lenkan.io/fullchain.pem $out_dir/live/lenkan.io/fullchain.pem
ln -sf /etc/letsencrypt/live/lenkan.io/privkey.pem $out_dir/live/lenkan.io/privkey.pem
