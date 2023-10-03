pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = "YOUR_DOCKERHUB_USERNAME/YOUR_DOCKERHUB_REPO:YOUR_DOCKER_IMAGE_TAG"
        DOCKER_HUB_CREDENTIALS = credentials('DOCKER_HUB_CREDS_ID')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout your source code repository here if needed
                    // For example: git credentialsId: 'GIT_CREDENTIALS_ID', url: 'https://github.com/your/repo.git'
                }
            }
        }

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
