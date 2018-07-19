#!/bin/bash
# Laravel Linux Setup 
# http://ask.osify.com

echo ""
echo ""
echo "                            Ask.osify.com                          "
echo ""
echo "..:::Laravel Linux Setup File/Folder Permission for Production:::.."
echo "..................................................................."

echo "Make sure, you have created the missing folders in storage, storage/framework..."

mkdir bootstrap/cache storage storage/framework && cd storage/framework && mkdir sessions views cache

echo "Webserver as owner, please wait... "
echo "In my case, my webserver user/group is daemon, normally they are www-data"

read -p "Press [Enter] key if ready or Ctrl+C to cancel..."
echo ""
echo ""

sudo chown -R daemon:daemon .

sudo find * -type f -exec chmod 644 {} \;   
sudo find * -type d -exec chmod 755 {} \;

#echo "Your user as ower"
#sudo chown -R root:daemon .

#sudo find * -type f -exec chmod 664 {} \;    
#sudo find * -type d -exec chmod 775 {} \;

echo "Then give the webserver the rights to read and write to storage and cache"
echo ""
echo ""

sudo chown -R daemon:daemon vendor storage storage/framework storage/framework/cache storage/framework/sessions storage/framework/views bootstrap bootstrap/cache public/uploads

sudo chgrp -R daemon vendor storage storage/framework storage/framework/cache storage/framework/sessions storage/framework/views bootstrap bootstrap/cache public/uploads
sudo chmod -R ug+rwx vendor storage storage/framework storage/framework/cache storage/framework/sessions storage/framework/views bootstrap bootstrap/cache public/uploads

echo "Add ftp user to the www group"
echo ""
echo ""

sudo usermod -a -G daemon root

echo "Do some laravel stuff with php artisan"

php artisan cache:clear
php artisan config:clear
php artisan view:clear

echo ""
echo ""
echo ""
echo ""
echo "done!"
