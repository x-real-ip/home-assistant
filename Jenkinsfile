pipeline {
    agent any
    environment {
        ENVIRONMENT_SUFFIX = "prd"
        CUSTOM_IMAGE_TAG = "latest"
        CUSTOM_IMAGE_NAME = "home-assistant-${ENVIRONMENT_SUFFIX}"
        ORIGINAL_IMAGE_NAME = "homeassistant/home-assistant"
        REGISTRY_URL = "docker-registry.theautomation.nl"
        REGISTRY_CREDENTIALS = credentials('DockerRegistry') 
    }
    stages {

        stage('Cleanup') {
            steps {
                // This will remove all build cache, stopped containers, networks and volumes not used by at least one container, dangling images.
                echo "\n ========== CLEANUP ========== \n"
                sh 'docker system prune --all --volumes --force'
            }
        }

        stage('Validate') {
            agent {
                docker { image 'python:3' }
            }
            steps {
                // Check if code syntax is valid
                echo "\n ========== VALIDATE CODE ========== \n"
                sh 'set -x'
                sh 'pip3 install --upgrade pip yamllint'
                sh 'yamllint -c ./.yamllint .'
            }
        }

        stage('Build') {
            steps {
                // Building image
                echo "\n ========== BUILD ========== \n"
                sh """
                docker build -f app.dockerfile -t ${CUSTOM_IMAGE_NAME}:${CUSTOM_IMAGE_TAG} -t ${CUSTOM_IMAGE_NAME}:${BUILD_NUMBER} .
                """
                }
            }

        stage('Test') {
            parallel {
                stage('Test on latest') {
                    agent {
                        docker { image "${CUSTOM_IMAGE_NAME}:${CUSTOM_IMAGE_TAG}" }
                    }
                    steps {
                        echo "\n ========== TEST ========== \n"
                        sh 'mv config/secrets.yaml.example config/secrets.yaml'
                        sh 'mv config/google_assistant/google_service_account.json.example config/google_assistant/google_service_account.json'
                        sh 'python -m homeassistant --script check_config --config ./config/'
                    }
                }

                stage('Test dev') {
                    agent {
                        docker { image "${ORIGINAL_IMAGE_NAME}:dev" }
                    }
                    steps {
                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                            sh 'mv config/secrets.yaml.example config/secrets.yaml'
                            sh 'mv config/google_assistant/google_service_account.json.example config/google_assistant/google_service_account.json'
                            sh 'python -m homeassistant --script check_config --config ./config/'
                        }
                    }
                }

                stage('Test beta') {
                    agent {
                        docker { image "${ORIGINAL_IMAGE_NAME}:beta" }
                    }
                    steps {
                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                            sh 'mv config/secrets.yaml.example config/secrets.yaml'
                            sh 'mv config/google_assistant/google_service_account.json.example config/google_assistant/google_service_account.json'
                            sh 'python -m homeassistant --script check_config --config ./config/'
                        }
                    }
                }
            }
        }
    }
    post {
        // Clean Jenkins workspace after build
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
