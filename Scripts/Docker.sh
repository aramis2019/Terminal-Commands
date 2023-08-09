docker stop 53098ec621a9
docker kill 53098ec621a9

sudo systemctl status docker
sudo systemctl enable docker

# Starting Docker-Engine on boot
sudo systemctl enable docker.service
sudo systemctl enable /usr/lib/systemd/system/docker.service

sudo systemctl start docker
sudo service docker restart








docker build ./add-apt-packages -t dmitryprotasov769/airflow:2.6.3-python3.10-broadridge2.0

docker compose --profile flower up -d
