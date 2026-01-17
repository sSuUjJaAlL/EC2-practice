# patching
sudo apt update && sudo apt update -y

# install npm and node

sudo apt-get install npm -y


sudo npm i -g n 

sudo n lts

# install nginx
sudo apt-get install nginx -y

sudo systemctl start nginx
sudo systemctl enable nginx

sudo systemctl status nginx