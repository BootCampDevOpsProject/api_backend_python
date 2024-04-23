pipeline {
    agent any
    stages {
        stage('construir imagen') {
            steps {
                sh 'docker build -t app-test-docker .'
            }
        }
    }
}
