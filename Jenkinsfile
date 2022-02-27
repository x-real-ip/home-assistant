pipeline {
    agent none
    stages {

        stage('Validate') {
            agent {
                docker { image 'python:3' }
            }
            steps {
                sh 'set +x echo "Validate code...'
                sh 'pip3 install --upgrade pip black flake8 mypy pylint yamllint'
                sh 'yamllint -c ./.yamllint .'
            }
        }

        stage('Build Image') {
            agent any
            steps {
                sh 'echo "Building image..."'
                sh """
                docker build -f app.dockerfile -t home-assistant .
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
