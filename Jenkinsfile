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
                bat 'docker build -t jenkinsDockerImage:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                withCredentials([string(credentialsId: 'a5bffdde-491d-4df9-8e2b-fe41e8b2a241', variable: 'DOCKER_HUB_TOKEN')]) {
                    bat 'docker login -u arafa282 -p $DOCKER_HUB_TOKEN'
                    bat 'docker tag jenkinsDockerImage:latest arafa282/jenkins:latest'
                    bat 'docker push arafa282/jenkins:latest'
                }
            }
        }
    }
}
