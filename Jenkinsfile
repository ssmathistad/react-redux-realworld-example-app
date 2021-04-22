node {    
  def app     
  stage('Clone repository') {               
    checkout scm    
  }     
  
  stage('Build image') {         
    app = docker.build("octumn/realworld_frontend")    
  }   
   
  stage('Push image') {
    docker.withRegistry('https://registry.hub.docker.com', 'git') {            
      app.push("${env.BUILD_NUMBER}")            
      app.push("v1.1.${BUILD_NUMBER}")        
    }    
  }
  
}
