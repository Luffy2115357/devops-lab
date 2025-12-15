cat <<EOF > Jenkinsfile
pipeline {
    agent any 
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code...'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-python-app .'
                }
            }
        }
        stage('Test') {
            steps {
                 sh 'docker run my-python-app'
            }
        }
    }
}
EOF
