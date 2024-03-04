pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Define Maven options and goals
                    def mavenHome = tool name: 'Maven', type: 'maven'
                    def mavenCMD = "/bin/mvn"
                    
                    // Maven build
                    bat "mvn clean install"
                }
            }
        }
    }
}
