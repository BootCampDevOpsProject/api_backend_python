pipeline {
    agent any
    stages {
        stage('clonar repo') {
            steps {
                sh 'git clone https://github.com/BootCampDevOpsProject/api_backend_python'
            }
        }
        stage('construir imagen') {
            steps {
                sh 'docker build -t app-test-docker .'
            }
        }
        stage('correr imagen') {
            steps {
                sh 'docker run -d -p 5000:5000 app-test-docker'
            }
        }
    }
}
