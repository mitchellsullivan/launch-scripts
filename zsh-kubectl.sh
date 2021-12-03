sudo apt update

sudo apt install zsh -y
sudo usermod --shell $(which zsh) $(whoami)
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt install -y apt-transport-https ca-certificates curl

# Download the Google Cloud public signing key:
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# Add the Kubernetes apt repository:
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update apt package index with the new repository and install kubectl:
sudo apt update
sudo apt install -y kubectl

# # #
source <(kubectl completion zsh) 
echo "[[ $commands[kubectl] ]] && source <(kubectl completion zsh)" >> ~/.zshrc

# # #
sudo snap install microk8s --classic
sudo newgrp microk8s
microk8s enable dashboard dns registry storage ingress
