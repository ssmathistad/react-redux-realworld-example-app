pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        checkout scm
      }
    }
    stage('Building Image') {
      steps {
        sh "docker build -t octumn/realworld_frontend:v1.0.$BUILD_NUMBER ."
      }
    }
    stage('Pushing Image') {
      steps{
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'usr', passwordVariable: 'pwd')]) {
            //sh "docker login --username=usr --password=pwd"
            //sh "echo pwd | docker login --username=usr --password-stdin"
            //sh "echo 'pwd' | docker login --username=usr --password-stdin"
            //sh "echo $pwd | docker login --username=$usr --password-stdin"
            //sh "echo $pwd > docker login --username=$usr --password-stdin"
            sh "docker logout"
            sh "echo pwd > docker login --username=usr --password-stdin"
            sh "docker push octumn/realworld_frontend:v1.0.$BUILD_NUMBER"
        }
      }
    }
  }
}
