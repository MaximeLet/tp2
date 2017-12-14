# Dockerfile for ionic test server using karma, jasmine, chrome headless.
# Built command: docker build -t rescapes_test . 
# Run command: docker run --name=rescapes_test -v ~/.ssh:/root/.ssh rescapes_test
#
# Note: This assumes that the local user is propery configured to access Gituhub through SSH without prompt.
#        ie.: 1) run the following on local machine
#                ssh-keygen -t rsa -C "maximeletourneau.1@gmail.com"
#             2) cut and paste ~/.ssh/id_rsa.pub into the appropriate bos into Github profile settings.  Enjoys!
#

FROM ubuntu:14.04

MAINTAINER Maxime Letourneau version: 0.1

# Update ubuntu, install curl, install git, install clean and install vim
RUN apt-get update && \
	apt-get install -y curl git wget vim python build-essential apt-transport-https &&\
	apt-get clean 
	

# Install Node version manager
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

RUN mkdir -p /vaolotest
COPY ./compose/test_server/test.sh /vaolotest
RUN chmod +x /vaolotest/test.sh 

VOLUME /root/.ssh

WORKDIR /vaolotest

RUN echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN apt-get update &&\
 apt-get install -y google-chrome-stable

CMD /bin/bash ./test.sh 

