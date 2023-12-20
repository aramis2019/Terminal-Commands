

root\14all41
dev\14all41

DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04.2 LTS"
PRETTY_NAME="Ubuntu 22.04.2 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.2 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy


##############################################
# Docker Example Gitlab
# https://docs.gitlab.com/ee/install/docker.html
##############################################

mkdir ~/gitlab-app
sudo chown -R 200 ~/gitlab-app
nano docker-compose.yml
###########

version: '3.6'
services:
  web:
    image: 'gitlab/gitlab-ce:16.6.1-ce.0'
    restart: always
    hostname: 'localhost'
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        external_url 'http://localhost'
    ports:
      - '1095:80'
      - '1096:443'
      - '1097:22'
    volumes:
      - '/srv/gitlab/config:/etc/gitlab'
      - '/srv/gitlab/logs:/var/log/gitlab'
      - '/srv/gitlab/data:/var/opt/gitlab'
    shm_size: '256m'
 ###########  


sudo docker pull gitlab/gitlab-ce:16.6.1-ce.0

sudo mkdir -p /srv/gitlab/config /srv/gitlab/logs /srv/gitlab/data

sudo docker run --detach \
  --hostname localhost \
  --publish 1096:443 --publish 1095:80 --publish 1097:22 \
  --name gitlab \
  --restart always \
  --volume /srv/gitlab/config:/etc/gitlab \
  --volume /srv/gitlab/logs:/var/log/gitlab \
  --volume /srv/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce:16.6.1-ce.0


password: root\americanG1


export GITLAB_HOME=/srv/gitlab
