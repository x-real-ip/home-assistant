pipeline {
    agent any

    stages {

        stage('Validate') {
            steps {
                echo "Validate code.."
                /* Validate whether Prettier has been applied */
                sh 'prettier --check "./config/**/*.yaml'
            }
        }

        stage('Build') {
            steps {
                echo 'Building..'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }

    }
}