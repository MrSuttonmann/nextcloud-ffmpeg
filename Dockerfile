FROM nextcloud:fpm
COPY install-packages.sh .
RUN chmod +x install-packages.sh
RUN ./install-packages.sh

COPY cron/ /etc/systemd/system/
RUN ["systemctl", "enable", "--now", "nextcloudcron.timer"]