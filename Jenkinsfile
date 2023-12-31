pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = "cloudsheger/jenkins-docker:v3"
        DOCKER_HUB_CREDENTIALS = credentials('CLOUDSHEGER-DOCKERHUB')
    }

    stages {

        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Build the Docker image from the Dockerfile
                    sh "docker build -t $DOCKER_IMAGE_NAME ."

                    // Authenticate with Docker Hub
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                    }

                    // Push the Docker image to Docker Hub
                    sh "docker push $DOCKER_IMAGE_NAME"
                }
            }
        }
    }

    post {
        failure {
            echo 'Docker build and push failed!'
        }
        success {
            echo 'Docker build and push successful!'
        }
    }
}
