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
                bat 'docker build -t asaeed24/mywebapp:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: 'recenttoken', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
                    script {
                        def registry_url = "registry-1.docker.io/"
                        bat "docker login -u ${USER} -p ${PASSWORD} ${registry_url}"
                        bat "docker push asaeed24/mywebapp:latest"
                    }
                }
            }
        }
    }
}
