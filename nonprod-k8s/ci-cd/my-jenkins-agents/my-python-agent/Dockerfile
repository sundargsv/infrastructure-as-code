#### Image Name - asia.gcr.io/my-dev-platform/my-jenkins-python-agent:1.0.0

FROM jenkins/jnlp-slave:3.27-1-alpine as jnlp-base
USER root

USER jenkins
# This Dockerfile is used to build an image containing an node jenkins slave

FROM python:latest
LABEL maintainer="gsundar93@gmail.com"

# Upgrade and Install packages
RUN apt-get -qy update && apt-get -qy full-upgrade && apt-get install sudo -y && apt-get install -qy git

# Install a basic SSH server
RUN apt-get install -qy openssh-server && \
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
    mkdir -p /var/run/sshd

# Install docker
RUN apt-get install -y docker.io

# Install and setup kubeconfig
RUN apt-get install curl sudo && apt-get install -y apt-transport-https gnupg2 sudo
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get -qy update
RUN apt-get install -y kubectl=1.16.0-00 -V
RUN mkdir -p $HOME/.kube

# Install and setup helm 3
RUN wget https://get.helm.sh/helm-v3.1.0-linux-amd64.tar.gz
RUN tar xvf helm-v3.1.0-linux-amd64.tar.gz
RUN sudo mv linux-amd64/helm /usr/local/bin
RUN rm helm-v3.1.0-linux-amd64.tar.gz
RUN rm -rf linux-amd64
RUN helm version

RUN sudo usermod -aG docker root

COPY --from=jnlp-base /   .
ENTRYPOINT ["jenkins-slave"]