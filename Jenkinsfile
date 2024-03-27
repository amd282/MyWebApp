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
                bat 'docker build -t jenkinsdockerimage:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                bat 'docker tag jenkinsdockerimage:latest asaeed24/jenkins:latest'
                bat 'docker push asaeed24/jenkins:latest'
            }
        }
    }
}
