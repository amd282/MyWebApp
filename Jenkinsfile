pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Define Maven options and goals
                    def mavenHome = tool 'Maven'
                    def mavenCMD = "/bin/mvn"
                    
                    // Maven build
                    bat " clean install"
                }
            }
        }
    }
}
