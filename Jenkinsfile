pipeline {
    agent any
    environment {
        // Replace 'your-username' with your actual Docker Hub username
        DOCKER_HUB_USER = 'kushi0987'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Kushi-890/node.app.git'
            }
        }
        stage('Build Image') {
            steps {
                bat "docker build -t %DOCKER_HUB_USER%/node-app:latest ."
            }
        }
        stage('Push to Docker Hub') {
            steps {
                // Ensure you created credentials with ID 'docker-hub-credentials'
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    bat "docker login -u %USER% -p %PASS%"
                    bat "docker push %DOCKER_HUB_USER%/node-app:latest"
                }
            }
        }
        stage('Deploy Locally') {
            steps {
                bat 'docker stop kushi-app-container || ver > nul'
                bat 'docker rm kushi-app-container || ver > nul'
                bat "docker run -d -p 3000:3000 --name kushi-app-container %DOCKER_HUB_USER%/node-app:latest"
            }
        }
    }
}
