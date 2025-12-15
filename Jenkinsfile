pipeline {
    agent any 
    environment {
        // REPLACE THIS WITH YOUR DOCKER HUB USERNAME
        DOCKERHUB_USERNAME = 'madhudevops2026'
        IMAGE_NAME = 'my-python-app'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKERHUB_USERNAME/$IMAGE_NAME:latest ."
                }
            }
        }
        stage('Test') {
            steps {
                 sh "docker run $DOCKERHUB_USERNAME/$IMAGE_NAME:latest"
            }
        }
        stage('Deploy to Docker Hub') {
            steps {
                script {
                    echo 'Pushing image to Docker Hub...'
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                        sh "docker push $DOCKERHUB_USERNAME/$IMAGE_NAME:latest"
                    }
                }
            }
        }
    }
}