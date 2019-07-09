#! /bin/bash -eu

set -e

cd /usr/lib/apache2/modules/
if [ ! -f mod_dispatcher.so ]
then
    ln -s dispatcher-apache2.4-4.2.3.so mod_dispatcher.so
fi

cd /etc/apache2/mods-enabled/
if [ ! -f dispatcher.load ]
then
    ln -s ../mods-available/dispatcher.load dispatcher.load
    ln -s ../mods-available/dispatcher.conf dispatcher.conf
fi

rm -rf /run/apache2/*

exec /usr/sbin/apache2ctl -D FOREGROUND

