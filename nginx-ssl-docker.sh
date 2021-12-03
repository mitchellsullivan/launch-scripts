# Installs nginx with certbot directly on machine and docker. 
# Used to reverse proxy to docker containers, all on one machine.

# install requirements for docker
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release -y

# add official docker keys
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install docker
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER
newgrp docker

# install docker-compose
sudo curl -L \
  "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# install nginx
sudo apt-get install nginx apache2-utils -y

# install certbot
sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

# run certbot
# sudo certbot --nginx

# sudo vim /etc/nginx/sites-available/default
# sudo vim /etc/nginx/nginx.conf
# sudo nginx -s reload
