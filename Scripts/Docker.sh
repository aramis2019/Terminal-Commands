docker stop 53098ec621a9
docker kill 53098ec621a9

sudo usermod -aG docker $USER && newgrp docker





docker build ./add-apt-packages -t dmitryprotasov769/airflow:2.6.3-python3.10-broadridge2.0

docker compose --profile flower up -d


## SSH Server on Ubuntu 22
sudo service ssh start
sudo service ssh stop
sudo service ssh status
# Generate kays in /home/username/.ssh/id_rsa
ssh-keygen
# Add public key to authorized_keys
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys