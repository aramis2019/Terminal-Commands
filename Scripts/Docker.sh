docker stop 53098ec621a9
docker kill 53098ec621a9






docker build ./add-apt-packages -t dmitryprotasov769/airflow:2.6.3-python3.10-broadridge2.0

docker compose --profile flower up -d
