pipeline {
    agent {
        docker { image 'homeassistant/home-assistant:latest' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'python -m homeassistant --script check_config --config ./config/'
            }
        }
    }
}
