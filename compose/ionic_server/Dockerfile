# Dockerfile for Ionic server from team "rescapes".
# This container is used for the following branches: master, staging, and prod
# Built command: docker build -t rescapes_ionic_server . 
# Run command for master: docker run -e "BRANCH=master" -e "PORT=7000" -e "PORT2=35729"  --name=rescapes_master -p 7000:7000 -v ~/.ssh:/root/.ssh -it rescapes_ionic_server
# Run command for staging: docker run -e "BRANCH=staging" -e "PORT=7001" -e "PORT2=35730"  --name=rescapes_staging -p 7001:7001 -v ~/.ssh:/root/.ssh -it rescapes_ionic_server
# Run command for prod: docker run -e "BRANCH=prod" -e "PORT=7002" -e "PORT2=35731"  --name=rescapes_staging -p 7002:7002 -v ~/.ssh:/root/.ssh -it rescapes_ionic_server
# Example of restart command: docker restart rescapes_staging
#
# Note: This assumes that the local user is propery configured to access Gituhub through SSH without prompt.
#

FROM ubuntu:14.04

MAINTAINER Maxime Letourneau version: 0.1

# Update ubuntu, install curl, install git, install clean and install vim
RUN apt-get update && \
	apt-get install -y curl git wget vim python build-essential &&\
	apt-get clean
	

# Install Nnode version manager
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 8.6.0

# Install nvm with node and npm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh  | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN ls -al $NVM_DIR/versions/node/v$NODE_VERSION/bin

# confirm installation
RUN node -v
RUN npm -v

# Install Ionic2
RUN npm install -g cordova ionic

# Project
RUN mkdir -p /vaolo/master
RUN mkdir -p /vaolo/staging
RUN mkdir -p /vaolo/prod
COPY ./compose/ionic_server/ionic-serve-vaolo.sh /vaolo
RUN chmod +x /vaolo/ionic-serve-vaolo.sh 

RUN mkdir -p /root/.ionic

WORKDIR /vaolo

EXPOSE 7000 7001 7002 35729 35730 35731 

CMD /vaolo/ionic-serve-vaolo.sh && \
    tail -f /dev/null

