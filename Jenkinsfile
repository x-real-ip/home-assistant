pipeline {
    agent {
        docker { image 'tmknom/prettier:latest' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'echo "hello world"'
            }
        }
    }
}