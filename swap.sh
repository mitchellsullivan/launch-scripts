
# 3 gig swap
sudo dd if=/dev/zero of=/mnt/swapfile bs=1M count=3072
sudo chown root:root /mnt/swapfile
sudo chmod 600 /mnt/swapfile
sudo mkswap /mnt/swapfile
sudo swapon /mnt/swapfile

sudo echo '/mnt/swapfile swap swap defaults 0 0' >> /etc/fstab

sudo swapon -a

sudo echo 'vm.swappiness=10' >> /etc/sysctl.conf
sudo sysctl -p
