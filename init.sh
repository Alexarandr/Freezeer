#!/bin/bash

# declarer des variables d'env

COUNTRY_NAME=FR
STATE=CA
LOCALITY_NAME=LILLE
ORGANIZATION_NAME=DOCKER
COMMON_NAME=ARNAUD
PASSPHRASE=root


# generer les cles ssh

ssh-keygen -f jenkins_rsa -q -N ""

# generer le certificat/cle et la passphrase

openssl genrsa -passout pass:$PASSPHRASE -out "server.key"

openssl req  -x509 -new -key server.key -out server.crt -sha256 -subj "/C=${COUNTRY_NAME}/ST=\ /L=${LOCALITY_NAME}/O=${ORGANIZATION_NAME}/CN=${COMMON_NAME}"

# copier les fichiers au bon endroit

cp jenkins_rsa agent_ssh/
mv jenkins_rsa jenkins/
mv server.crt nginx/
mv server.key nginx/
echo "$PASSPHRASE" > nginx/passphrase

cp jenkins_rsa.pub agent_ssh/

ssh-keygen -e -f jenkins_rsa.pub | sed -E  "/Comment/d" > proftpd/jenkins_rsa.pub

rm jenkins_rsa.pub

docker-compose up -d --build
