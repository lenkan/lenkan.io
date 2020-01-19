
server {
  listen 80;
  server_name lenkan.io;

  location / {
    return 301 https://$host$request_uri;
  }
}

server {
  listen 443 ssl;
  server_name lenkan.io;

  root /var/www/lenkan.io;
  ssl_certificate /etc/letsencrypt/live/lenkan.io/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/lenkan.io/privkey.pem;
  include /etc/letsencrypt/options-ssl-nginx.conf;
  ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
  
  location / {
  }
}
