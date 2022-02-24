pipeline {
    agent {
        docker { image 'tmknom/prettier:latest' }
    }
    stages {
        stage('Test') {
            steps {
                'prettier --check "./config/**/*.yaml"'
            }
        }
    }
}