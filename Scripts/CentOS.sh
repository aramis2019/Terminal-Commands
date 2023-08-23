

# Get version
sudo yum install redhat-lsb-core
lsb_release -d
hostnamectl


# General Info
hostnamectl
python3 --version
python3.7 -V
sudo python3.7 -m pip --version
pwsh -Command '$PSVersionTable'

# Processes
htop --user=ec2-user
htop --user=$USER

# Run Airflow env
cd ~/airflow
source .venv/bin/activate

# Run Airflow scheduler
cd ~/airflow
source .venv/bin/activate
airflow scheduler -D --log-file /home/ec2-user/airflow/logs/scheduler/log.txt --stderr /home/ec2-user/airflow/logs/scheduler/std-error.txt --stdout /home/ec2-user/airflow/logs/scheduler/std-out.txt

# Run Airflow webserver
cd ~/airflow
source .venv/bin/activate
airflow webserver -D --port 8080 --log-file /home/ec2-user/airflow/logs/webserver/log.txt --stderr /home/ec2-user/airflow/logs/webserver/std-error.txt --stdout /home/ec2-user/airflow/logs/webserver/std-out.txt


# Docker Airflow
sudo systemctl enable docker-airflow-app
sudo systemctl start docker-airflow-app
sudo systemctl status docker-airflow-app