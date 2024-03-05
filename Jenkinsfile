pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Define Maven options and goals
                    def mavenHome = tool name: 'Maven', type: 'maven'
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    
                    // Maven build
                    bat "${mavenCMD} clean install"
                    
                    // Archive the artifacts (WAR file, in this case)
                    archiveArtifacts 'target/your-web-app.war'
                }
            }
        }
    }
}
