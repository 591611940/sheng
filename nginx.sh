#!/bin/bash
yum -y install gcc pcre-devel openssl-devel  zlib-devel  mariadb  mariadb-server  mariadb-devel php php-mysql  
echo '正在装包'
tar -xf lnmp_soft.tar.gz
cd lnmp_soft/
yum -y install php-fpm-5.4.16-42.el7.x86_64.rpm  php-pecl-memcache.x86_64
useradd -s /sbin/nologin/   nginx
tar -xf nginx-1.12.2.tar.gz 
cd  nginx-1.12.2/ 
./configure  \
--with-http_ssl_module  \
--with-stream  \
--with-http_stub_status_module
echo '正在编译'
make && make install
echo '正在安装'

ln -s /usr/local/nginx/sbin/nginx    /sbin/
nginx
nginx -s reload
systemctl stop  php-fpm  mariadb
systemctl restart php-fpm  mariadb
systemctl enable  php-fpm  mariadb

