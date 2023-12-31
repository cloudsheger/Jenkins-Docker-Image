FROM jenkins/jenkins:lts

# Running as root to have an easy support for Docker
USER root

# A default admin user
ENV ADMIN_USER=admin \
    ADMIN_PASSWORD=password

# Jenkins init scripts
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/

# Install Jenkins plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN apt-get -qq update && \
    apt-get install wget
RUN wget -q https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/plugin-management-parent-pom-2.0.0/jenkins-plugin-manager-2.0.0.jar -O /usr/local/lib/jenkins-plugin-manager.jar

# Install Docker, kubectl and helm
RUN apt-get -qq update && \
    apt-get -qq -y install curl && \
    curl -sSL https://get.docker.com/ | sh && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
