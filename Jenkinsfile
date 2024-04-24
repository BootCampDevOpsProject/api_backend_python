pipeline {
    agent any

    environment {
        dockerImage=''
        registry='alexserret/proyecto-devops'
        registryCredential = 'dockerhub_id'
    }
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
                sh 'docker rm -f api-backend || true'  // Eliminar el contenedor si existe
                sh 'docker run -d -p 5000:5000 --name api-backend app-test-docker'  // Ejecutar el contenedor nuevamente
            }
        }
        stage('construir imagen docker registry') {
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        } 
        stage('subir imagen') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                    dockerImage.push()
                    }
                }
            }
        }
    }
    post { // Aquí especificamos acciones posteriores al pipeline
        success { // Acciones a realizar en caso de éxito
            slackSend(channel:'#alertas-jenkins', message: "SUCCESS! test")
        }
    }
}
