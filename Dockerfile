FROM nextcloud:fpm

COPY install-packages.sh .
RUN chmod +x install-packages.sh
RUN ./install-packages.sh

RUN crontab -u www-data -l | { cat; echo "*/5  *  *  *  * php -f /var/www/nextcloud/cron.php"; } | crontab -u www-data -
RUN crontab -u www-data -l | { cat; echo "*/5  *  *  *  * php /var/www/nextcloud/occ preview:pre-generate"; } | crontab -u www-data -

CMD cron