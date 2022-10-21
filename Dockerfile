FROM nextcloud:fpm

COPY install-packages.sh .
RUN chmod +x install-packages.sh
RUN ./install-packages.sh
ADD crontab /etc/crontabs/www-data