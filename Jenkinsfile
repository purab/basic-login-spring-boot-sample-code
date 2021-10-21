pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-cred')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t purabdk/basic-login:latest .'
      }
    }

  }
  post {
    always {
         script {
            if (getContext(hudson.FilePath)) {
                deleteDir()
            }
        }
    }
  }
}