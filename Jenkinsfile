pipeline {
    agent any
    stages {
        stage('clonar repo') {
            steps {
                script {
                    sh 'if [ -d "api_backend_python" ]; then rm -rf api_backend_python; fi' // Eliminar el directorio existente si existe
                    sh 'git clone https://github.com/BootCampDevOpsProject/api_backend_python'
                }
            }
        }
        stage('construir imagen') {
            steps {
                dir('api_backend_python') {
                    sh 'docker build -t app-test-docker .'
                }
            }
        }
        stage('correr imagen') {
            steps {
                sh 'docker run -d -p 5000:5000 app-test-docker'
            }
        }
    }
}
