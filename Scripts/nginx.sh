systemctl status nginx
curl -4 icanhazip.com

sudo systemctl restart nginx
sudo systemctl reload nginx

sudo nginx -t


sudo systemctl stop nginx
sudo systemctl start nginx

####################################################
### Add new Server Blocks 
####################################################

sudo apt update
sudo apt install nginx
sudo ufw app list
sudo ufw status
sudo ufw COMMAND

sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo ufw allow OpenSSH

sudo ufw enable

systemctl status nginx
curl -4 icanhazip.com

sudo systemctl restart nginx
sudo systemctl reload nginx

# Setting Up Server Blocks 
sudo mkdir -p /var/www/combofox.com/html
sudo chown -R $USER:$USER /var/www/combofox.com/html
sudo chmod -R 755 /var/www/combofox.com
nano /var/www/combofox.com/html/index.html

sudo nano /etc/nginx/sites-available/combofox.com

# Next, let’s enable the file by creating a link from it to the sites-enabled directory, which Nginx reads from during startup:
sudo ln -s /etc/nginx/sites-available/combofox.com /etc/nginx/sites-enabled/

sudo nano /etc/nginx/nginx.conf

sudo nginx -t

# Install Origin certificate
# https://developers.cloudflare.com/ssl/origin-configuration/origin-ca
# https://www.digicert.com/kb/csr-ssl-installation/nginx-openssl.htm

# Create files and paste certificate and key
cd /etc/ssl
touch combofox.com.pem 
touch combofox.com.key

####################################################

sudo mkdir -p /var/www/nexus.combofox.com
sudo chown -R $USER:$USER /var/www/nexus.combofox.com

sudo mkdir /var/www/nexus.combofox.com/html
sudo chown -R www-data:www-data /var/www/nexus.combofox.com/html

####################################################

## Subdomain

sudo mkdir -p /var/www/n combofox.com/html


####################################################
### SSL https://www.nginx.com/blog/using-free-ssltls-certificates-from-lets-encrypt-with-nginx/
####################################################

# Download the Let’s Encrypt Client
apt-get update
sudo apt-get install certbot
apt-get install python3-certbot-nginx

# Specify your domain name (and variants, if any) with the server_name directive:
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    server_name example.com www.example.com;
}

#Check configuration
nginx -t && nginx -s reload

#Obtain the SSL/TLS Certificate

sudo certbot --nginx -d example.com -d www.example.com

#Automatically Renew Let’s Encrypt Certificates

crontab -e

#Add the certbot command to run daily. In this example
0 12 * * * /usr/bin/certbot renew --quiet



####################################################
####################################################