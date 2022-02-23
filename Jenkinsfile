pipeline {
    agent any
    stages {
        stage('Validate Prettier') {
            agent {
                docker {
                    image 'tmknom/prettier:latest'
                    // Run the container on the node specified at the top-level of the Pipeline, in the same workspace, rather than on a new node entirely:
                    reuseNode true
                }
            }
            steps {
                sh 'prettier --check "./config/**/*.yaml'
            }
        }
    }
}