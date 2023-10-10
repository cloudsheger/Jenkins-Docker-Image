# Jenkins-Docker-Image


1. FOLK this project
2. git clone https://github.com/cloudsheger/Jenkins-Docker-Image.git

   
# How to run

```
docker build -t jenkins-docker .

docker run -it -p 9090:9090 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --restart unless-stopped -d jenkins-docker


```
