# This file sets up an Ubuntu 24.04 VM to run SimpleBox
# It will run a HTTP server (Nginx) for the static UI files
# and a reverse proxy for Django

sudo apt update && sudo apt upgrade -y

sudo apt install -y python3-venv nginx npm

git clone https://github.com/dragon-cave/simplebox-api
git clone https://github.com/dragon-cave/simplebox-ui

cd simplebox-api
cp .env.example .env
vim .env
vim s3django/settings.py
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python manage.py makemigrations s3django user
python manage.py migrate
deactivate
chmod +x run.sh
touch simplebox-api.service
echo "[Unit]
Description=systemd service for running the SimpleBox API

[Service]
ExecStart=/bin/bash $PWD/run.sh

[Install]
WantedBy=multi-user.target" > simplebox-api.service
sudo mv simplebox-api.service /etc/systemd/system/
sudo systemctl enable simplebox-api
sudo systemctl start simplebox-api

cd ../simplebox-ui
cp .env.example .env
vim .env
npm install
npm run build
sudo cp -r dist/ /var/www/simplebox-ui/
sudo chown -R root:root /var/www/simplebox-ui/

cd ..
vim nginx.conf
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
sudo cp nginx.conf /etc/nginx/sites-available/simplebox
sudo ln -s /etc/nginx/sites-available/simplebox /etc/nginx/sites-enabled/simplebox
sudo systemctl enable nginx
sudo systemctl start nginx
sudo nginx -s reload