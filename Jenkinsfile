pipeline {
    agent any

    environment {
        IMAGE_NAME = "webapp"	// docker image name
        TAG = "latest"
    }

    stages {
        stage('Clone Code') {
            steps {
                echo "Cloning repository..."
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker Image..."
                dir('mywebapp') {
                    bat "docker build -t %IMAGE_NAME%:%TAG% ."
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo "Deploying to Kubernetes..."
                dir('mywebapp') {
                    bat "kubectl apply -f deployment.yaml"
                }
            }
        }
    }
}