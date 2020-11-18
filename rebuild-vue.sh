#!/bin/bash
# Laravel Linux Setup
# http://ask.osify.com

echo "This script for rebuild project, if you already did, please cancel it."
echo "We will do as following: "
echo "> User ownership on local folder"
echo "> Run laravel setup"
echo "> Restart laravel-worker"
echo "> Run migration"
echo "> Solve permission issue on node_modules"
echo "> Build production for VueJS"
read -p "Press [Enter] key if ready or Ctrl+C to cancel..."
echo ""
echo ""

sudo chown -R $USER /usr/local
sh laravel-linux-setup.sh

supervisorctl restart laravel-worker:*
php artisan migrate --seed

chmod -R a+x node_modules

npm run production


echo "done!"
