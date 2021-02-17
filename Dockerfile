# membuild image berdasarkan parent image Ubuntu
FROM ubuntu

# update package list, install package php, module apache2, dan module mysql
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install php7.4 libapache2-mod-php php-mysql apache2 -y

# copy index.php ke web server (/var/www/trucorp2)
ADD index.php /var/www/trucorp2/

# ganti web server directory dary /var/www/html menjadi /var/www/trucorp2
RUN sed -i "s/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/trucorp2/g" /etc/apache2/sites-enabled/000-default.conf

# set access control www-data (beri kepemilikan user & group kw www-data, dan hilangkan permission write execute dari other)
RUN chown -R www-data:www-data /var/www/trucorp2 && chmod -R o-wx /var/www/trucorp2

# buka port 80(apache) di container
EXPOSE 80

# run apache web server di foreground
CMD ["apachectl", "-D", "FOREGROUND"]
