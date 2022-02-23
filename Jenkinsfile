pipeline {
    agent {
        docker { image 'tmknom/prettier:latest' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'prettier --check "./config/**/*.yaml'
            }
        }
    }
}