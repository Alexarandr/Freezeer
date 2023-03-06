#!/bin/bash

sed -i -E "s/^user .*$/user root;/g" /etc/nginx/nginx.conf

/usr/sbin/fcgiwrap -s unix:/run/fcgiwrap.socket & 

/usr/sbin/nginx -g "daemon off;" &


wait -n
exit $?
