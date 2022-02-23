pipeline {
    agent any
    stages {
        stage('Validate') {
            agent {
                docker {
                    image 'tmknom/prettier:latest' {
                    echo "Validate code.."
                    // Run the container on the node specified at the top-level of the Pipeline, in the same workspace, rather than on a new node entirely:
                    reuseNode true
                    // Validate whether Prettier has been applied
                    sh 'prettier --check "./config/**/*.yaml'
            }
        }
    }
}