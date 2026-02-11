pipeline {
    agent any

    environment {
        IMAGE_NAME = "kushi0987/node-devops-app"
    }

    stages {

        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Kushi-890/node-devops-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME%:latest ."
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    bat "docker login -u %DOCKER_USER% -p %DOCKER_PASS%"
                    bat "docker push %IMAGE_NAME%:latest"
                }
            }
        }

        stage('Run Container') {
            steps {
                bat "docker rm -f node-app || exit 0"
                bat "docker run -d -p 3000:3000 --name node-app %IMAGE_NAME%:latest"
            }
        }
    }
}
