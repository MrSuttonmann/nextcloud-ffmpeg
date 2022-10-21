#!/bin/bash
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y upgrade
apt-get -y install apt-utils
apt-get -y install git nano wget
apt-get -y install software-properties-common
apt-get -y install ffmpeg
apt-get -y install exiftool

apt-get -y install imagemagick imagemagick-common

t=$(mktemp)
wget 'https://dist.1-2.dev/imei.sh' -qO "$t"
bash "$t"
rm "$t"

cp /etc/ImageMagick-6/policy.xml /etc/ImageMagick-6/policy.xml.bak
sed -i "s/rights\=\"none\" pattern\=\"PS\"/rights\=\"read\|write\" pattern\=\"PS\"/" /etc/ImageMagick-6/policy.xml
sed -i "s/rights\=\"none\" pattern\=\"EPI\"/rights\=\"read\|write\" pattern\=\"EPI\"/" /etc/ImageMagick-6/policy.xml
sed -i "s/rights\=\"none\" pattern\=\"PDF\"/rights\=\"read\|write\" pattern\=\"PDF\"/" /etc/ImageMagick-6/policy.xml
sed -i "s/rights\=\"none\" pattern\=\"XPS\"/rights\=\"read\|write\" pattern\=\"XPS\"/" /etc/ImageMagick-6/policy.xml
apt-get clean
rm -rf /var/lib/apt/lists/*
