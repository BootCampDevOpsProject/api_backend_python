pipeline {
    agent any

    environment {
        dockerImage=''
        registry='alexserret/proyecto-devops'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub_id')
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
                    sh 'docker build -t app-test-docker:latest .'
                }
            }
        }
        stage('correr imagen') {
            steps {
                sh 'docker rm -f api-backend || true'  // Eliminar el contenedor si existe
                sh 'docker run -d -p 5000:5000 --name api-backend app-test-docker'  // Ejecutar el contenedor nuevamente
            }
        }
        stage('login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                }
            }
        stage('subir imagen') {
            steps {
                sh 'docker push alexserret/proyecto-devops:app-test-docker:latest'
                }
            }
        }
    post { // Aquí especificamos acciones posteriores al pipeline
        success { // Acciones a realizar en caso de éxito
            slackSend(channel:'#alertas-jenkins', message: "SUCCESS! test")
        }
        always {
            sh 'docker logout'
        }
    }
}
