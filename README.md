# Jenkins-Docker-Image

# How to run

```
docker build -t jenkins-docker .
docker run --name jenkins -p 8080:8080 -d jenkins-docker

```