FROM jenkins/jenkins:latest

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /bin/jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
COPY casc.yaml /var/jenkins_home/casc.yaml

COPY seedjob.groovy /usr/local/seedjob.groovy
COPY --chown=jenkins jenkins_rsa /var/jenkins_home/private
#USER root
#RUN apt update && apt install git
#USER jenkins


