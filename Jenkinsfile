pipeline {
    agent none
    environment {
        CONFIG_SECRETS_CMD= 'mv config/secrets.yaml.example config/secrets.yaml'
    }
    stages {
        stage('Test latest image') {
            agent {
                docker { image 'homeassistant/home-assistant:latest' }
            }
            steps {
                sh "${CONFIG_SECRETS_CMD}"
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
    }
}


// pipeline {
//     agent {
//         docker { image 'homeassistant/home-assistant:latest' }
//     }
//     stages {
//         stage('Test') {
//             steps {
//                 sh 'mv config/secrets.yaml.example config/secrets.yaml'
//                 sh 'mv config/google_assistant/google_service_account.json.example config/google_assistant/google_service_account.json'
//                 sh 'python -m homeassistant --script check_config --config ./config/'
//             }
//         }
//     }
// }
