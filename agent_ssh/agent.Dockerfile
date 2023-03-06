FROM archlinux




# Installation des paquets necessaires

RUN pacman -Sy --noconfirm \
&& pacman -S --noconfirm git python-pip jdk11-openjdk openssh python \
&& useradd jenkins -m \
&& mkdir /home/jenkins/.ssh \
&& pip install pylint

# envoie de la cle publique

COPY jenkins_rsa.pub /home/jenkins/.ssh/authorized_keys

COPY --chown=jenkins jenkins_rsa /home/jenkins/.ssh/jenkins_rsa

RUN ssh-keygen -A \
&& mkdir -p /run/sshd

# on lance le serveur SSH

CMD /usr/bin/sshd -D



