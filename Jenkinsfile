pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
   //Note: use Multibranch pipeline and just put your git repo url
    // Put your credentails jenkins - http://localhost:9090/credentials/ - id=dockerhub-cred
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-cred')
  }
  stages {
      stage("Env Variables") {
            steps {
                sh "printenv"
            }
     }
     stage('Build JAR') {
        steps {
          //build the JAR file by using command
          sh './gradlew build'
        }
    }
    stage('Build') {
      steps {
        //using Build number Jenkins environment variable
        sh 'docker build -t purabdk/basic-login:${BUILD_NUMBER} .'
      }
    }
    stage('Login') {
          steps {
           //login to docker hub
            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
          }
    }
    stage('Push') {
      steps {
        //push image to docker hub
        sh 'docker push purabdk/basic-login:${BUILD_NUMBER}'
      }
    }
  }
  post {
    always {
         script {
            if (getContext(hudson.FilePath)) {
                deleteDir()
            }
            sh 'docker logout'
        }
    }
  }
}