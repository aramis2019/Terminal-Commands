server {

        root /var/www/combofox.com/html;
        index index.html index.htm index.nginx-debian.html;

        server_name combofox.com www.combofox.com;

        #location / {
        #   try_files $uri $uri/ =404;
        #}

        listen [::]:443 ssl ipv6only=on; # managed by Certbot
        listen 443 ssl; # managed by Certbot
        ssl_certificate /etc/letsencrypt/live/combofox.com/fullchain.pem; # managed by Certbot
        ssl_certificate_key /etc/letsencrypt/live/combofox.com/privkey.pem; # managed by Certbot
        include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
        ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot


        location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto "https"; proxy_pass http://localhost:8081;
        }

        location /v2/ {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto "https";
        proxy_pass http://localhost:8081;
        }

}
server {
        if ($host = www.combofox.com) {
        return 301 https://$host$request_uri;
        } # managed by Certbot

        if ($host = combofox.com) {
        return 301 https://$host$request_uri;
        } # managed by Certbot

        listen 80;
        listen [::]:80;

        server_name combofox.com www.combofox.com;
        return 404; # managed by Certbot
}

