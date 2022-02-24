pipeline {
    agent {
        docker { image 'node:16.13.1-alpine' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}


// pipeline {
//     agent {
//         docker { image 'tmknom/prettier:latest' }
//     }
//     stages {
//         stage('Test') {
//             steps {
//                 sh 'echo "hello world"'
//             }
//         }
//     }
// }