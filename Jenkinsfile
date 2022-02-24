pipeline {
    agent {
        docker { image 'tmknom/prettier:latest' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'ls -la'
            }
        }
    }
}
