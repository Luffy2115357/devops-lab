pipeline {
    agent any

    stages {
        stage('Build Image') {
            steps {
                echo 'Building the Docker Image...'
                // This builds the container and names it "my-portfolio"
                sh 'docker build -t my-portfolio .'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying to Port 5005...'
                // 1. Stop the old container (if it's running) so we don't get an error
                sh 'docker stop portfolio-container || true'
                // 2. Remove the old container to make room for the new one
                sh 'docker rm portfolio-container || true'
                // 3. Run the new container! Mapping host port 5005 to container port 5000
                sh 'docker run -d -p 5005:5000 --name portfolio-container my-portfolio'
            }
        }
    }
}
