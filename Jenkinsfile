pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'webapp:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/yourusername/yourrepository.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    bat "docker build -t %DOCKER_IMAGE% ."
                }
            }
        }

        stage('Load Docker Image into Minikube') {
            steps {
                script {
                    // Instead of pushing to a registry, directly load into Minikube
                    bat "minikube image load %DOCKER_IMAGE%"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    bat "kubectl apply -f deployment.yaml"
                }
            }
        }

        stage('Access the Web App') {
            steps {
                script {
                    bat "kubectl rollout status deployment/webapp-deployment"
                    bat "minikube service webapp-service --url"
                }
            }
        }
    }
}