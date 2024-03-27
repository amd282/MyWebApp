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
                withCredentials([usernamePassword(credentialsId: 'dockertoken', usernameVariable: 'asaeed24', passwordVariable: 'Mahmoud28@')]) {
                    script {
                        def registry_url = "registry.hub.docker.com/"
                        bat "docker login -u $USER -p $PASSWORD ${registry_url}"
                        bat "docker tag jenkinsdockerimage:latest asaeed24/jenkins:latest"
                        bat "docker push asaeed24/jenkins:latest"
                    }
                }
            }
        }
    }
}
