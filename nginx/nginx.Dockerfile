FROM nginx

RUN apt update \
&& rm /etc/nginx/conf.d/* \
&& apt install -y fcgiwrap python3 \
&& mkdir -p /var/www/cgi-bin/ \
&& mkdir /etc/nginx/ssl 

COPY https.conf /etc/nginx/conf.d/https.conf
COPY passphrase /etc/nginx/ssl/passphrase
COPY fcgiwrap_params /etc/nginx/fcgiwrap_params
COPY main.cgi /var/www/cgi-bin/main.cgi


COPY server.crt /etc/nginx/ssl/server.crt
COPY server.key /etc/nginx/ssl/server.key


COPY wrapper.sh /wrapper.sh

CMD ./wrapper.sh 
