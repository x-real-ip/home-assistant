pipeline {
    agent none
    environment {
        TEST= 'Test'
    }

    stages {
        stage('Validate yaml') {
            agent {
                docker { image 'sdesbure/yamllint:latest' }
            }
            steps {
                sh 'yamllint -c ./.yamllint .'
            }
        }
        stage('Test latest image') {
            agent {
                docker { image 'homeassistant/home-assistant:latest' }
            }
            steps {
                sh 'mv config/secrets.yaml.example config/secrets.yaml'
                sh 'mv config/google_assistant/google_service_account.json.example config/google_assistant/google_service_account.json'
                sh 'python -m homeassistant --script check_config --config ./config/'
            }
        }
        stage('Test dev image') {
            agent {
                docker { image 'homeassistant/home-assistant:dev' }
            }
            steps {
                sh 'mv config/secrets.yaml.example config/secrets.yaml'
                sh 'mv config/google_assistant/google_service_account.json.example config/google_assistant/google_service_account.json'
                sh 'python -m homeassistant --script check_config --config ./config/'
            }
        }
        stage('Test beta image') {
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
    post {
        // Clean after build
        always {
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true)
        }
    }
}