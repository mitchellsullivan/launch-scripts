sudo apt update

sudo apt install zsh -y
sudo usermod --shell $(which zsh) $(whoami)

cat <<EOF >> ~/.zshrc 
export PATH="\$PATH:/snap/bin"
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
EOF


