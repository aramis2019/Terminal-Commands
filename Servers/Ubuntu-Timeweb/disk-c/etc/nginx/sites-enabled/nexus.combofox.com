server {
	root /var/www/nexus.combofox.com/html;
	index index.html index.htm index.nginx-debian.html;

	server_name nexus.combofox.com www.nexus.combofox.com;

	listen 443 ssl; # managed by Certbot
        ssl_certificate /etc/letsencrypt/live/nexus.combofox.com/fullchain.pem; # managed by Certbot
        ssl_certificate_key /etc/letsencrypt/live/nexus.combofox.com/privkey.pem; # managed by Certbot
	include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
	ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
	client_max_body_size 1G;

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
    if ($host = www.nexus.combofox.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = nexus.combofox.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    
    listen 80;

    server_name nexus.combofox.com www.nexus.combofox.com;
    return 404; # managed by Certbot




}
