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
                withCredentials([string(credentialsId: 'githubToken', variable: 'DOCKER_HUB_TOKEN')]) {
                    bat 'echo %DOCKER_HUB_TOKEN% | docker login -u arafa282 --password-stdin'
                    bat 'docker tag jenkinsdockerimage:latest arafa282/jenkins:latest'
                    bat 'docker push arafa282/jenkins:latest'
                }
            }
        }
    }
}
