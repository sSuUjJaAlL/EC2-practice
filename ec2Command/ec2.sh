#!/bin/bash

set -e

echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

echo "Installing npm..."
sudo apt install npm -y

echo "Installing Node.js LTS..."
sudo npm install -g n
sudo n lts

echo "Verifying Node and npm versions..."
node -v
npm -v

echo "Installing NGINX..."
sudo apt install nginx -y

echo "Starting and enabling NGINX..."
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Checking NGINX status..."
sudo systemctl status nginx --no-pager

echo "Configuring NGINX for Express app..."
if [ -f /etc/nginx/sites-available/express-app ]; then
    sudo ln -sf /etc/nginx/sites-available/express-app /etc/nginx/sites-enabled/
else
    echo "WARNING: /etc/nginx/sites-available/express-app not found"
fi

echo "Testing NGINX configuration..."
sudo nginx -t

echo "Restarting NGINX..."
sudo systemctl restart nginx

echo "Cleaning up..."
sudo apt autoremove -y
sudo apt autoclean

echo "Setup completed successfully!"