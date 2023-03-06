# FREEZER

Projet de mise en place d'une architecture DevOps pour servir une application de lecture de Musique.

Freezer se veut comme une alternative libre à Deezer. Chacun peut récupèrer ce projet et lancer une instance d'un serveur Freezer où il veut avec l'aide de Docker.



## Démarrage sans Docker-compose:


L'application CGI Freezer est sur le dépot: [python_cgi](https://github.com/bkoj-arch/python_cgi)
Le jenkinsFile sur le dépot est lu par jenkins et c'est à travers celui-ci qu'on pourra configurer nos pipelines


### Creation Network et Volumes:

     - docker network create freeze --subnet 1.2.3.0/24 --gateway 1.2.3.1 
    
     - docker volume create nginx_pro

### BUILD:

    - cd agent_ssh  && docker build -t agent -f agent.Dockerfile .

    - cd jenkins  && docker build -f jenkins.Dockerfile -t my_jenkins .

    - cd proftpd  && docker build -f proftpd.Dockerfile -t my_proftpd .

    - cd nginx  && docker build -t my_nginx -f nginx.Dockerfile .

    - cd postgres && docker build -t my_postgre -f postgres.Dockerfile .

### RUN:

    -  docker run -d --name my_proftpd -e "PASV_ADDRESS=1.2.3.40" --network freeze --ip 1.2.3.40 -v nginx_pro:/home/jenkins/cgi-bin/ my_proftpd  

    -  docker run -d --name my_nginx --network freeze --ip 1.2.3.10 -v nginx_pro:/var/www/cgi-bin/ my_nginx 

    -  docker run -d --name agent --network freeze --ip 1.2.3.20 agent 

    -  docker run --name jen --network freeze --ip 1.2.3.30 --env SSH_PRIVATE_KEY="$(cat jenkins_rsa)" --env JENKINS_ADMIN_ID=admin --env JENKINS_ADMIN_PASSWORD=password my_jenkins

    - docker run --name my_postgres --network freeze --ip 1.2.3.50 -e POSTGRES_PASSWORD=password -d my_postgre


## Démarrage avec Docker-compose:

```bash init.sh```


## Démarrage avec ansible:








