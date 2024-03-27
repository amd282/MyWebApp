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
                withCredentials([usernamePassword(credentialsId: 'newdokertoken', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
                    script {
                        def registry_url = "registry.hub.docker.com/"
                        bat "echo ${PASSWORD} | docker login -u ${USER} --password-stdin ${registry_url}"
                        bat "docker tag jenkinsdockerimage:latest asaeed24/jenkins:latest"
                        bat "docker push asaeed24/jenkins:latest"
                    }
                }
            }
        }
    }
}
