pipeline {
    agent any  // Run on any available Jenkins agent
    
    environment {
        IMAGE_NAME = 'node-app'  // Name of the Docker image
        CONTAINER_NAME = 'node-app-container'  // Name of the container
    }

    stages {
        stage('Check Docker') {
            steps {
                // Check if Docker is available
                sh 'docker --version'
            }
        }

        stage('Checkout') {
            steps {
                // Checkout the code from GitHub repository
                git branch: 'main', url: 'https://github.com/sibilucky/jenkin.git'
                // Replace with your repo URL
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image from the Dockerfile
                sh 'docker build -t node-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container from the built image
                sh 'docker run -d -p 3000:3000 --name node-app-container node-app'
            }
        }

        stage('Stop Docker Container') {
            steps {
                // Stop and remove the Docker container after the build
                sh 'docker stop node-app-container'
                sh 'docker rm node-app-container'
            }
        }

        stage('Cleanup Docker Containers') {
            steps {
                script {
                    // Clean up any existing containers if needed
                    sh 'docker ps -a -q --filter "name=node-app-container" | xargs --no-run-if-empty docker rm -f'
                }
            }
        }
    }

    // The post block should be here, outside the stages block
    post {
        always {
            // Clean up Docker resources (optional)
            echo 'Cleaning up Docker containers...'
            sh 'docker ps -a'
        }
    }
}
