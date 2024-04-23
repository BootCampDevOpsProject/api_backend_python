pipeline {
    agent any
    stages {
        stage('instalar docker') {
            steps {
                sh 'sudo apt-get update'
            }
        stage('construir imagen') {
            steps {
                sh 'sudo apt-get install docker-ce docker-ce-cli containerd.io'
            }
            
        stage('construir imagen') {
            steps {
                sh 'docker build -t app-test-docker .'
            }
        }
    }
}
