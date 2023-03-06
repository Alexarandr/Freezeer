
FROM instantlinux/proftpd

RUN apk update && apk add proftpd-mod_sftp openssh \
&&  adduser -h /home/jenkins -D jenkins

USER jenkins

RUN mkdir -m 777  /home/jenkins/cgi-bin/ \
&& mkdir  /home/jenkins/artefacts 
#mkdir /etc/proftpd/authorized_keys

USER root

RUN ssh-keygen -A

COPY jenkins_rsa.pub /etc/proftpd/authorized_keys/jenkins  
COPY proftpd.conf /etc/proftpd/proftpd.conf

