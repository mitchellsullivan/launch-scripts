
sudo snap install microk8s --classic
sudo snap install kubectl --classic

source <(kubectl completion zsh)
echo "[[ $commands[kubectl] ]] && source <(kubectl completion zsh)" >> ~/.zshrc

sudo microk8s.start

until microk8s.status ; do sleep 1 ; done

mkdir ~/.kube
microk8s config > ~/.kube/config

sudo microk8s.enable dashboard registry:size=5Gi storage dns ingress helm3 host-access 
