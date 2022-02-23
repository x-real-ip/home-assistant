pipeline {
    agent none
    stages {
        stage('Validate Prettier') {
            agent {
                docker { image 'tmknom/prettier:latest' }
            }
            steps {
                sh 'prettier --check "./config/**/*.yaml'
            }
        }
    }
}