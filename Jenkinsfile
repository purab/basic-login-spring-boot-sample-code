pipeline {
  label 'master'
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('purabdk-dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t purabdk/basic-login:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push purabdk/basic-login:latest'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}