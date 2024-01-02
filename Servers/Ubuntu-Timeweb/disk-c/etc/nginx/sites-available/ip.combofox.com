server {

    root /var/www/ip.combofox.com/html;
    index index.html index.htm index.nginx-debian.html;

    server_name ip.combofox.com www.ip.combofox.com;



    listen [::]:443 ssl; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/ip.combofox.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/ip.combofox.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot


}
server {
    if ($host = www.ip.combofox.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = ip.combofox.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    listen [::]:80;

    server_name ip.combofox.com www.ip.combofox.com;
    return 404; # managed by Certbot




}