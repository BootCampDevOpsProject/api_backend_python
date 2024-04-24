pipeline {
    agent any
    stages {
        stage('clonar repo') {
            steps {
                script {
                    if (fileExists('api_backend_python')) {
                        sh 'rm -rf api_backend_python' // Eliminar el directorio existente
                    }
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

def fileExists(path) {
    return file(path).exists()
}
