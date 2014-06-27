# DOCKER-VERSION 1.0.0

FROM    centos:6.4

# Enable EPEL for Node.js
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Node.js and NPM
RUN     yum install -y npm
RUN     yum install -y git
ADD     . /src

RUN     cd /src; npm install
RUN     cd /src; npm install npm

EXPOSE  3000
CMD ["node", "/src/app.js"]

# How to build the docker image for Candy:

# build candy image first
# $ sudo docker build -t <your username>/candy

# then run as a service
# $ sudo docker run -p 8080:3000 -d <your username>/candy

# check out if we did, fetch the container ID.
# $ sudo docker ps

# And print app output
$ sudo docker logs <container id>