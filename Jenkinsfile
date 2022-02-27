pipeline {
    agent any
    environment {
        IMAGE_IMAGE_NAME='home-assistant'
        CUSTOM_IMAGE_NAME='home-assistant'
        IMAGE_VERSION='latest'
    }
    stages {

        stage('Cleanup') {
            steps {
                // This will remove all build cache, stopped containers, networks and volumes not used by at least one container, dangling images.
                sh 'set +x && echo "" && echo "========== CLEANUP ==========" '
                sh 'set -x'
                sh 'docker system prune --all --volumes --force'
            }
        }

        stage('Validate') {
            agent {
                docker { image 'python:3' }
            }
            steps {
                // Check if code syntax is valid
                sh 'set +x && echo "" && echo "========== VALIDATE CODE ==========" '
                sh 'set -x'
                sh 'pip3 install --upgrade pip yamllint'
                sh 'yamllint -c ./.yamllint .'
            }
        }

        stage('Build Image') {
            steps {
                // Building image
                echo "========== BUILD IMAGE =========="
                sh """
                docker build -f app.dockerfile -t ${CUSTOM_IMAGE_NAME}:${IMAGE_VERSION} -t ${CUSTOM_IMAGE_NAME}:${BUILD_NUMBER} .
                """
                }
            }

        stage('Run Tests') {
            parallel {
                stage('Test on latest') {
                    agent {
                        docker { image 'homeassistant/home-assistant:latest' }
                    }
                    steps {
                        sh 'mv config/secrets.yaml.example config/secrets.yaml'
                        sh 'mv config/google_assistant/google_service_account.json.example config/google_assistant/google_service_account.json'
                        sh 'python -m homeassistant --script check_config --config ./config/'
                    }
                }

                stage('Test on dev') {
                    agent {
                        docker { image 'homeassistant/home-assistant:dev' }
                    }
                    steps {
                        sh 'mv config/secrets.yaml.example config/secrets.yaml'
                        sh 'mv config/google_assistant/google_service_account.json.example config/google_assistant/google_service_account.json'
                        sh 'python -m homeassistant --script check_config --config ./config/'
                    }
                }

                stage('Test on beta') {
                    agent {
                        docker { image 'homeassistant/home-assistant:beta' }
                    }
                    steps {
                        sh 'mv config/secrets.yaml.example config/secrets.yaml'
                        sh 'mv config/google_assistant/google_service_account.json.example config/google_assistant/google_service_account.json'
                        sh 'python -m homeassistant --script check_config --config ./config/'
                    }
                }
            }

        }
    }   
    post {
        // Clean after build
        always {
            cleanWs(cleanWhenAborted: true,
                    cleanWhenFailure: true,
                    cleanWhenNotBuilt: true,
                    cleanWhenSuccess: true,
                    cleanWhenUnstable: true,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true)
        }
    }
}
