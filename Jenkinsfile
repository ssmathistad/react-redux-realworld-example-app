pipeline {
  environment {
    registry = "octumn/realworld_frontend"
    registryCredential = 'dockerhub'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        checkout scm
      }
    }
    stage('Building image') {
      steps {
        sh "docker build -t octumn/realworld_frontend:v1.1.$BUILD_NUMBER ."
      }
    }
    stage('Building image') {
      steps{
        
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'usr', passwordVariable: 'pwd')]) {
            sh "docker login --username=usr --password=pwd"
            sh "docker push octumn/realworld_frontend:v1.0.$BUILD_NUMBER"
        }
      }
    }
  }
}
