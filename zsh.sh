
sudo apt install zsh -y
sudo usermod --shell $(which zsh) $(whoami)
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

source < (kubectl completion zsh) 
echo "[[ $commands[kubectl] ]] && source < (kubectl completion zsh)" >> ~/.zshrc
