# Dockerfile for Jenkins server for tp2 project from team "rescapes".
# This Dockerfile is an extension of the official image for Jenkins.  Modifications have been made to 
# allow saving changes, support for shared ssh credential files, and 
# installation of additional tools required to run docker containers from the Jenkins job (this is required for project TP2)
#
# Note that Jenkins data files are mapped to ~/tp2/jenkins/data/ by default.  Please backup of this folder from time to time!
#
# Built command: docker build -t rescapes_jenkins . 
# Run command: docker run --name=rescapes_jenkins -p 8080:8080 -p 50000:50000 -v /tmp/jenkins/:/tmp/jenkins/ -v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock -v ~/.ssh:/root/.ssh -v ~/jenkins/data/:/var/jenkins_home rescapes_jenkins

FROM jenkins/jenkins:lts

MAINTAINER Maxime Letourneau version: 0.1

USER root
RUN apt-get update \
      && apt-get install -y sudo ruby make libltdl-dev \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

COPY plugins.txt /usr/share/jenkins/plugins.txt
VOLUME /root/.ssh
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
