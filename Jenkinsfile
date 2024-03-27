pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the Maven project...'
                bat 'mvn clean install'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t asaeed24/devops:latest .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                echo 'Logging in to Docker Hub...'
                withCredentials([string(credentialsId: 'newdokertoken', variable: 'DOCKER_HUB_TOKEN')]) {
                    bat 'docker login -u arafa282 -p $DOCKER_HUB_TOKEN'
                }

            }
        }
        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                bat "docker push asaeed24/devops:latest"
            }
        }
    }
}
