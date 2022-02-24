pipeline {
    agent {
        docker { image 'homeassistant/home-assistant:latest' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'mv config/secrets.yaml.example config/secrets.yaml'
                sh 'mv config/google_assistant/google_service_account.json.example config/google_assistant/google_service_account.json'
                sh 'python -m homeassistant --script check_config --config ./config/'
            }
        }
    }
}
